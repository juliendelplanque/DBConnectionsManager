"
I describe a connection to a database.
"
Class {
	#name : #DBConnectionDescription,
	#superclass : #Object,
	#instVars : [
		'name',
		'hostname',
		'port',
		'databaseName',
		'userName',
		'password',
		'connection',
		'hasAlreadyConnect',
		'privateState',
		'wasDisconnectedByUser',
		'announcer',
		'dbms'
	],
	#category : 'DBConnectionsManager-Core'
}

{ #category : #'instance creation' }
DBConnectionDescription class >> for: aDBDataBaseManagementSystem [
	^ self new
		dbms: aDBDataBaseManagementSystem;
		yourself
]

{ #category : #accessing }
DBConnectionDescription >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #api }
DBConnectionDescription >> buildConnection [
	"Build a connection using the current driver. While this connection is not an object implemented in one of the DBC* package, it understands:
	- #dbcmConnect
	- #dbcmDisconnect
	- #dbcmExecute:
	"
	^ self dbms buildConnectionFrom: self
]

{ #category : #api }
DBConnectionDescription >> connect [
	(self connection isNotNil and: [ self connection isConnected ])
		ifTrue: [ ^ self ].
	connection := self buildConnection.
	connection dbcmConnect.
	self
		hasAlreadyConnect: true;
		wasDisconnectedByUser: false.
	self announcer
		announce: (DBConnectionWasConnectedByUser connectionDescription: self)
]

{ #category : #accessing }
DBConnectionDescription >> connection [
	^ connection
]

{ #category : #accessing }
DBConnectionDescription >> connection: anObject [
	connection := anObject
]

{ #category : #accessing }
DBConnectionDescription >> databaseName [
	^ databaseName
]

{ #category : #accessing }
DBConnectionDescription >> databaseName: anObject [
	databaseName := anObject
]

{ #category : #accessing }
DBConnectionDescription >> dbms [
	^ dbms
]

{ #category : #accessing }
DBConnectionDescription >> dbms: anObject [
	dbms := anObject
]

{ #category : #api }
DBConnectionDescription >> disconnect [
	(self connection isNotNil and: [ self connection dbcmIsConnected ])
		ifFalse: [ ^ self ].
	
	self connection dbcmDisconnect.
	self
		connection: nil;
		wasDisconnectedByUser: true.
		
	self announcer announce: (DBConnectionWasDisconnectedByUser connectionDescription: self)
]

{ #category : #api }
DBConnectionDescription >> execute: aString [
	"Execute the SQL query contained in #aString on the DB connected."
	self connection
		ifNil: [ self error: 'Please connect to the database before trying to execute a query!' ].

	^ self connection dbcmExecute: aString
]

{ #category : #accessing }
DBConnectionDescription >> hasAlreadyConnect [
	^ hasAlreadyConnect
]

{ #category : #accessing }
DBConnectionDescription >> hasAlreadyConnect: anObject [
	hasAlreadyConnect := anObject
]

{ #category : #accessing }
DBConnectionDescription >> hostname [
	^ hostname
]

{ #category : #accessing }
DBConnectionDescription >> hostname: anObject [
	hostname := anObject
]

{ #category : #initialization }
DBConnectionDescription >> initialize [
	super initialize.
	self
		hasAlreadyConnect: false;
		wasDisconnectedByUser: false
]

{ #category : #accessing }
DBConnectionDescription >> name [
	^ name
]

{ #category : #accessing }
DBConnectionDescription >> name: anObject [
	name := anObject
]

{ #category : #accessing }
DBConnectionDescription >> password [
	^ password
]

{ #category : #accessing }
DBConnectionDescription >> password: anObject [
	password := anObject
]

{ #category : #accessing }
DBConnectionDescription >> port [
	^ port ifNil: [ self dbms defaultConnectionPort ]
]

{ #category : #accessing }
DBConnectionDescription >> port: anObject [
	port := anObject
]

{ #category : #printing }
DBConnectionDescription >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self name;
		<< $)
]

{ #category : #accessing }
DBConnectionDescription >> privateState [
	^ privateState ifNil: [ self resetPrivateState ]
]

{ #category : #'private state' }
DBConnectionDescription >> resetPrivateState [
	^ privateState := Dictionary new
]

{ #category : #api }
DBConnectionDescription >> test [
	"
	Perform a query on the database to verify the connection is alive.
	
	Returns a DBConnectionTestResult.
	"
	|startTime endTime|
	[ 
		startTime := DateAndTime now.
		self execute: 'SELECT 1;'.
		endTime := DateAndTime now
	 ] on: Error do: [ 
		^ DBConnectionTestResult new
			startTime: startTime;
			endTime: DateAndTime now;
			isAlive: false;
			yourself
	].
	
	^ DBConnectionTestResult new
			startTime: startTime;
			endTime: endTime;
			isAlive: true;
			yourself
]

{ #category : #accessing }
DBConnectionDescription >> userName [
	^ userName
]

{ #category : #accessing }
DBConnectionDescription >> userName: anObject [
	userName := anObject
]

{ #category : #accessing }
DBConnectionDescription >> wasDisconnectedByUser [
	^ wasDisconnectedByUser
]

{ #category : #accessing }
DBConnectionDescription >> wasDisconnectedByUser: anObject [
	wasDisconnectedByUser := anObject
]
