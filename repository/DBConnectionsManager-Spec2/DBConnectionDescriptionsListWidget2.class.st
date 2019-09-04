Class {
	#name : #DBConnectionDescriptionsListWidget2,
	#superclass : #SpPresenter,
	#instVars : [
		'connectionDescriptionsList',
		'subscribedTo'
	],
	#category : #'DBConnectionsManager-Spec2'
}

{ #category : #specs }
DBConnectionDescriptionsListWidget2 class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #connectionDescriptionsList;
		yourself
]

{ #category : #adapting }
DBConnectionDescriptionsListWidget2 >> adaptToConnectionsManager: aDBConnectionsManager [
	subscribedTo ifNotNil: [ 
		self unsubscribeFromSubscribedTo ].

	subscribedTo := aDBConnectionsManager.
	
	subscribedTo announcer
		when: DBConnectionDescriptionAdded send: #descriptionAdded: to: self;
		when: DBConnectionDescriptionRemoved send: #descriptionRemoved: to: self;
		when: DBConnectionDied send: #connectionDied: to: self;
		when: DBConnectionRevive send: #connectionRevive: to: self;
		when: DBConnectionWasDisconnectedByUser send: #connectionWasDisconnectedByUser: to: self;
		when: DBConnectionWasConnectedByUser send: #connectionWasConnectedByUser: to: self;
		when: DBConnectionsManagerStartedChecking send: #connectionsManagerStartedChecking: to: self;
		when: DBConnectionsManagerStoppedChecking send: #connectionsManagerStoppedChecking: to: self;
		when: DBConnectionStillAlive send: #connectionStillAlive: to: self;
		when: DBCanNotConnect send: #canNotConnect: to: self.
	
	connectionDescriptionsList
		items: aDBConnectionsManager connections
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> buildMenuBlock: aBlock [
	self connectionDescriptionsList contextMenu: [ :builder |
		aBlock value: builder.
		builder ]
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> canNotConnect: aDBCanNotConnect [
	aDBCanNotConnect connectionDescription beNotConnectable.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #accessing }
DBConnectionDescriptionsListWidget2 >> connectionDescriptionsList [
	^ connectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionDied: aDBConnectionDied [

	aDBConnectionDied connectionDescription beDead.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionRevive: aDBConnectionRevive [

	aDBConnectionRevive connectionDescription beAlive.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionStillAlive: aDBConnectionStillAlive [

	aDBConnectionStillAlive connectionDescription beAlive.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionWasConnectedByUser: aDBConnectionWasConnectedByUser [
	aDBConnectionWasConnectedByUser connectionDescription
		beUnchecked.
		
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionWasDisconnectedByUser: aDBConnectionWasDisconnectedByUser [
	aDBConnectionWasDisconnectedByUser connectionDescription
		beUnknown.
		
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionsManagerStartedChecking: aDBConnectionsManagerStartedChecking [
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionsManagerStoppedChecking: aDBConnectionsManagerStoppedChecking [
	aDBConnectionsManagerStoppedChecking connectionsManager connections
		do: #beUnknown
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> descriptionAdded: aDBConnectionDescriptionAdded [
	connectionDescriptionsList
		items: aDBConnectionDescriptionAdded connectionsManager connections.
	self unselectConnectionDescription
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> descriptionRemoved: aDBConnectionDescriptionRemoved [
	connectionDescriptionsList
		items: aDBConnectionDescriptionRemoved connectionsManager connections
]

{ #category : #initialization }
DBConnectionDescriptionsListWidget2 >> initializePresenter [
	connectionDescriptionsList
		display: [ :connectionDescription | connectionDescription name ];
		icons:
				[ :connectionDescription | Smalltalk ui iconNamed: connectionDescription iconState ].
	self sortAlphabetically
]

{ #category : #initialization }
DBConnectionDescriptionsListWidget2 >> initializeWidgets [
	connectionDescriptionsList := self newList
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> openWithSpec [
	super openWithSpec.
	
	self window
		whenClosedDo: [ self unsubscribeFromSubscribedTo ]
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> selectedConnectionDescription [
	^ self connectionDescriptionsList selectedItem
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> sortAlphabetically [
	self sortingBlock: [ :a :b | a name < b name ]
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> sortingBlock [
	^ self connectionDescriptionsList sortingBlock
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> sortingBlock: aBlock [
	self connectionDescriptionsList sortingBlock: aBlock
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> unselectConnectionDescription [
	self connectionDescriptionsList resetSelection
]

{ #category : #private }
DBConnectionDescriptionsListWidget2 >> unsubscribeFromSubscribedTo [
	subscribedTo announcer unsubscribe: self
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> whenSelectedItemChanged: aBlock [
	self connectionDescriptionsList
		whenSelectionChangedDo: [ :selection | aBlock cull: selection selectedItem ]
]
