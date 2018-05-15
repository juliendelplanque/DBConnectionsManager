"
I am the object that manage and check the state of connections to a DBMS.

I create announcements depending on what happen on these connections. You can subscribe to my #announcer to receive these.
"
Class {
	#name : #DBConnectionsManager,
	#superclass : #Object,
	#instVars : [
		'connections',
		'announcer',
		'connectionsCheckerThread',
		'wasAliveDict',
		'sleepTime',
		'shouldContinueConnectionsChecking'
	],
	#classInstVars : [
		'current'
	],
	#category : 'DBConnectionsManager-Core'
}

{ #category : #accessing }
DBConnectionsManager class >> current [
	^ current ifNil: [ self resetCurrent ]
]

{ #category : #accessing }
DBConnectionsManager class >> current: aDBConnectionsManager. [
	current ifNotNil: [ 
		current announcer
			announce: (DBCurrentConnectionsManagerChanged new
							connectionsManager: aDBConnectionsManager;
							oldConnectionManager: current;
							yourself) ].
	current := aDBConnectionsManager
]

{ #category : #reset }
DBConnectionsManager class >> resetCurrent [
	self current: self new.
	^ current
]

{ #category : #adding/removing }
DBConnectionsManager >> add: aDBConnectionDescription [
	(self connections anySatisfy: [ :any | any name = aDBConnectionDescription name ])
		ifTrue: [ self error: 'The name of a connection description should be unique in all connections descriptions of a DBConnectionsManager.' ].
	self connections add: aDBConnectionDescription.
	
	wasAliveDict at: aDBConnectionDescription put: false.
	
	aDBConnectionDescription announcer
		when: DBConnectionDescriptionAnnouncement send: #forwardAnnouncement: to: self.
		
	self announceConnectionDescriptionAdded: aDBConnectionDescription.
]

{ #category : #announcing }
DBConnectionsManager >> announce: aDBConnectionsManagerAnnouncement [
	"Set the #connectionsManager of the announcement given as argument to be myself and announce it using my #announcer."
	aDBConnectionsManagerAnnouncement
		connectionsManager: self.
	
	self announcer
		announce: aDBConnectionsManagerAnnouncement
]

{ #category : #announcing }
DBConnectionsManager >> announceConnectionDescriptionAdded: aDBConnectionDescription [
	self announce: (DBConnectionDescriptionAdded connectionDescription: aDBConnectionDescription)
]

{ #category : #announcing }
DBConnectionsManager >> announceConnectionDescriptionRemoved: aDBConnectionDescription [
	self announce: (DBConnectionDescriptionRemoved connectionDescription: aDBConnectionDescription)
]

{ #category : #announcing }
DBConnectionsManager >> announceConnectionDied: aDBConnectionDescription withTestResult: testResult [
	self announce: ((DBConnectionDied connectionDescription: aDBConnectionDescription)
							testResult: testResult
							yourself)
]

{ #category : #announcing }
DBConnectionsManager >> announceConnectionDisconnectedByUser: aDBConnectionDescription [
	self announce: (DBConnectionWasDisconnectedByUser connectionDescription: aDBConnectionDescription)
]

{ #category : #announcing }
DBConnectionsManager >> announceConnectionRevive: aDBConnectionDescription withTestResult: testResult [
	self announce: ((DBConnectionRevive connectionDescription: aDBConnectionDescription)
							testResult: testResult
							yourself)
]

{ #category : #announcing }
DBConnectionsManager >> announceConnectionStillAlive: aDBConnectionDescription withTestResult: testResult [
	self announce: ((DBConnectionStillAlive connectionDescription: aDBConnectionDescription)
							testResult: testResult
							yourself)
]

{ #category : #announcing }
DBConnectionsManager >> announceStartedChecking [
	self announce: DBConnectionsManagerStartedChecking new
]

{ #category : #announcing }
DBConnectionsManager >> announceStoppedChecking [
	self announce: DBConnectionsManagerStoppedChecking new
]

{ #category : #accessing }
DBConnectionsManager >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #'connections checking' }
DBConnectionsManager >> checkConnection: connectionDescription [
	| testResult |
	connectionDescription wasDisconnectedByUser
		ifTrue: [
			wasAliveDict at: connectionDescription put: false.
			^ self ].
	
	testResult := connectionDescription test.
	
	(testResult isAlive not and: [ connectionDescription hasAlreadyConnect ])
		ifTrue: [ 
			[ connectionDescription connect ] on: Error do: [ "Do nothing." ].
			testResult := connectionDescription test
		].
	
	(testResult isAlive and: [ (self wasAlive: connectionDescription) not ])
		ifTrue: [ self announceConnectionRevive: connectionDescription withTestResult: testResult ].
	
	(testResult isAlive not and: [ self wasAlive: connectionDescription ])
		ifTrue: [ self announceConnectionDied: connectionDescription withTestResult: testResult ].
		
	(testResult isAlive and: [ self wasAlive: connectionDescription ])
		ifTrue: [ self announceConnectionStillAlive: connectionDescription withTestResult: testResult ].
	
	wasAliveDict at: connectionDescription put: testResult isAlive
]

{ #category : #'connections actions' }
DBConnectionsManager >> connectAll [
	self connectionsDo: #connect
]

{ #category : #'connections accessing' }
DBConnectionsManager >> connectionNamed: aString [
	^ self connections detect: [ :connectionDescription |
		connectionDescription name = aString ]
]

{ #category : #accessing }
DBConnectionsManager >> connections [
	^ connections
]

{ #category : #accessing }
DBConnectionsManager >> connections: anObject [
	connections := anObject
]

{ #category : #enumerating }
DBConnectionsManager >> connectionsCollect: aBlock [
	self connections collect: aBlock
]

{ #category : #enumerating }
DBConnectionsManager >> connectionsDo: aBlock [
	self connections do: aBlock
]

{ #category : #enumerating }
DBConnectionsManager >> connectionsReject: aBlock [
	self connections reject: aBlock
]

{ #category : #enumerating }
DBConnectionsManager >> connectionsSelect: aBlock [
	self connections select: aBlock
]

{ #category : #accessing }
DBConnectionsManager >> defaultSleepTime [
	^ 5 seconds
]

{ #category : #'connections actions' }
DBConnectionsManager >> disconnectAll [
	self connectionsDo: #disconnect
]

{ #category : #'announcement handling' }
DBConnectionsManager >> forwardAnnouncement: aDBConnectionsManagerAnnouncement [
	"Simply forward the announcement to the listeners."
	self announce: aDBConnectionsManagerAnnouncement
]

{ #category : #gt-inspector-extension }
DBConnectionsManager >> gtConnectionsIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (composite fastTable)
		title: 'Connections';
		display: [ 
			self connections asOrderedCollection ];
		column: 'Name' evaluated: #name;
		column: 'Hostname' evaluated: #hostname width: 100;
		column: 'Port' evaluated: #port width: 50;
		column: 'Database' evaluated: #databaseName width: 150;
		column: 'User' evaluated: #userName;
		beMultiple;
		send: [ :result | result isNil 
			ifTrue:[nil]
			ifFalse:[ (result size = 1) 
				ifTrue: [result anyOne] 
				ifFalse: [self species withAll: result]]]
]

{ #category : #initialization }
DBConnectionsManager >> initialize [
	super initialize.
	self
		connections: OrderedCollection new;
		sleepTime: self defaultSleepTime.
		
	wasAliveDict := Dictionary new.
	shouldContinueConnectionsChecking := false
]

{ #category : #testing }
DBConnectionsManager >> isCheckingConnections [
	^ shouldContinueConnectionsChecking
]

{ #category : #testing }
DBConnectionsManager >> isConnectionsCheckingRunning [
	^ connectionsCheckerThread isNotNil and: [ connectionsCheckerThread isTerminated not ]
]

{ #category : #adding/removing }
DBConnectionsManager >> remove: aDBConnectionDescription [
	self connections remove: aDBConnectionDescription.
	
	wasAliveDict removeKey: aDBConnectionDescription.
	
	aDBConnectionDescription announcer
		unsubscribe: self.
		
	self announceConnectionDescriptionRemoved: aDBConnectionDescription.
]

{ #category : #adding/removing }
DBConnectionsManager >> removeAll [
	self connections copy do: [ :connectionDescription |
		self remove: connectionDescription ]
]

{ #category : #accessing }
DBConnectionsManager >> sleepTime [
	^ sleepTime
]

{ #category : #accessing }
DBConnectionsManager >> sleepTime: anObject [
	sleepTime := anObject
]

{ #category : #'connections checking' }
DBConnectionsManager >> startConnectionsChecking [
	shouldContinueConnectionsChecking := true.
	connectionsCheckerThread := [ 
		[ self connections do: [ :connectionDescription |
			self checkConnection: connectionDescription ].
			self sleepTime wait
		] doWhileTrue: [ shouldContinueConnectionsChecking ]
	] forkNamed: 'DBConnectionsManager''s connections checker'.

	self announceStartedChecking
]

{ #category : #'connections checking' }
DBConnectionsManager >> stopConnectionsChecking [
	shouldContinueConnectionsChecking := false.
	
	self announceStoppedChecking
]

{ #category : #private }
DBConnectionsManager >> wasAlive: aConnectionDescription [
	^ wasAliveDict at: aConnectionDescription
]
