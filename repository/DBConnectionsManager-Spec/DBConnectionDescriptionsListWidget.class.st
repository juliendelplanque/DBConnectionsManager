"
I am the widget representing the list of connections of DBConnectionsManager. I listen to its announcements to keep my list of connection descriptions up to date.

If your looking for the list menu appearing in the DBConnectionsManagerWidget, it is not defined here but in DBConnectionsManagerWidget>>#buildListMenuOn:.
"
Class {
	#name : #DBConnectionDescriptionsListWidget,
	#superclass : #ComposableModel,
	#instVars : [
		'connectionDescriptionsList',
		'subscribedTo'
	],
	#category : #'DBConnectionsManager-Spec-Widgets'
}

{ #category : #specs }
DBConnectionDescriptionsListWidget class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: #connectionDescriptionsList ]
]

{ #category : #adapting }
DBConnectionDescriptionsListWidget >> adaptToConnectionsManager: aDBConnectionsManager [
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
DBConnectionDescriptionsListWidget >> buildMenuBlock: aBlock [
	self connectionDescriptionsList menu: [ :builder |
		aBlock value: builder.
		builder ]
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> canNotConnect: aDBCanNotConnect [
	aDBCanNotConnect connectionDescription beNotConnectable.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #accessing }
DBConnectionDescriptionsListWidget >> connectionDescriptionsList [
	^ connectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionDied: aDBConnectionDied [

	aDBConnectionDied connectionDescription beDead.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionRevive: aDBConnectionRevive [

	aDBConnectionRevive connectionDescription beAlive.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionStillAlive: aDBConnectionStillAlive [

	aDBConnectionStillAlive connectionDescription beAlive.
	
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionWasConnectedByUser: aDBConnectionWasConnectedByUser [
	aDBConnectionWasConnectedByUser connectionDescription
		beUnchecked.
		
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionWasDisconnectedByUser: aDBConnectionWasDisconnectedByUser [
	aDBConnectionWasDisconnectedByUser connectionDescription
		beUnknown.
		
	self connectionDescriptionsList refreshListItems
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionsManagerStartedChecking: aDBConnectionsManagerStartedChecking [
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> connectionsManagerStoppedChecking: aDBConnectionsManagerStoppedChecking [
	aDBConnectionsManagerStoppedChecking connectionsManager connections
		do: #beUnknown
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> descriptionAdded: aDBConnectionDescriptionAdded [
	connectionDescriptionsList
		items: aDBConnectionDescriptionAdded connectionsManager connections.
	self unselectConnectionDescription
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget >> descriptionRemoved: aDBConnectionDescriptionRemoved [
	connectionDescriptionsList
		items: aDBConnectionDescriptionRemoved connectionsManager connections
]

{ #category : #initialization }
DBConnectionDescriptionsListWidget >> initializePresenter [
	connectionDescriptionsList
		displayBlock: [ :connectionDescription | connectionDescription name ];
		icons: [ :connectionDescription | Smalltalk ui iconNamed: connectionDescription iconState ].
	
	self sortAlphabetically
]

{ #category : #initialization }
DBConnectionDescriptionsListWidget >> initializeWidgets [
	connectionDescriptionsList := self newIconList
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> openWithSpec [
	super openWithSpec.
	
	self window
		whenClosedDo: [ self unsubscribeFromSubscribedTo ]
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> selectedConnectionDescription [
	^ self connectionDescriptionsList selectedItem
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> sortAlphabetically [
	self sortingBlock: [ :a :b | a name < b name ]
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> sortingBlock [
	^ self connectionDescriptionsList sortingBlock
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> sortingBlock: aBlock [
	self connectionDescriptionsList sortingBlock: aBlock
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> unselectConnectionDescription [
	self connectionDescriptionsList resetSelection
]

{ #category : #private }
DBConnectionDescriptionsListWidget >> unsubscribeFromSubscribedTo [
	subscribedTo announcer unsubscribe: self
]

{ #category : #api }
DBConnectionDescriptionsListWidget >> whenSelectedItemChanged: aBlock [
	self connectionDescriptionsList whenSelectedItemChanged: aBlock
]
