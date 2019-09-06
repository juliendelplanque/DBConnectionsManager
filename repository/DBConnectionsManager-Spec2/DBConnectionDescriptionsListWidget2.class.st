Class {
	#name : #DBConnectionDescriptionsListWidget2,
	#superclass : #SpPresenter,
	#instVars : [
		'connectionDescriptionsList',
		'subscribedTo'
	],
	#category : #'DBConnectionsManager-Spec2-Spec'
}

{ #category : #commands }
DBConnectionDescriptionsListWidget2 class >> buildCommandsGroupWith: presenter forRoot: aCmCommandsGroup [
	aCmCommandsGroup
		register: self buildConnectingGroup;
		register: self buildManagementGroup;
		register: self buildExtraGroup
]

{ #category : #commands }
DBConnectionDescriptionsListWidget2 class >> buildConnectingGroup [
	^ (CmCommandGroup named: 'Connecting') asSpecGroup
		register: ((CmCommandGroup named: 'Selected') asSpecGroup beDisplayedAsGroup
						register: DBConnectSelectedCommand2 forSpec;
						register: DBDisconnectSelectedCommand2 forSpec);
		register: ((CmCommandGroup named: 'All') asSpecGroup beDisplayedAsGroup
						register: DBConnectAllCommand2 forSpec;
						register: DBDisconnectAllCommand2 forSpec)
		
]

{ #category : #commands }
DBConnectionDescriptionsListWidget2 class >> buildExtraGroup [
	^ (CmCommandGroup named: 'Extra') asSpecGroup
		register: DBCopyNameToClipboardCommand2 forSpec;
		register: DBInspectSelectedCommand2 forSpec
]

{ #category : #commands }
DBConnectionDescriptionsListWidget2 class >> buildManagementGroup [
	^ (CmCommandGroup named: 'Management') asSpecGroup
		register: ((CmCommandGroup named: 'Selected') asSpecGroup beDisplayedAsGroup
						register: DBRemoveSelectedCommand2 forSpec);
		register: ((CmCommandGroup named: 'All') asSpecGroup beDisplayedAsGroup
						register: DBRemoveAllCommand2 forSpec)
]

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

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> canNotConnect: aDBCanNotConnect [
	aDBCanNotConnect connectionDescription beNotConnectable.
	
	self updateConnectionDescriptionsList
]

{ #category : #accessing }
DBConnectionDescriptionsListWidget2 >> connectionDescriptionsList [
	^ connectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionDied: aDBConnectionDied [

	aDBConnectionDied connectionDescription beDead.
	
	self updateConnectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionRevive: aDBConnectionRevive [

	aDBConnectionRevive connectionDescription beAlive.
	
	self updateConnectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionStillAlive: aDBConnectionStillAlive [

	aDBConnectionStillAlive connectionDescription beAlive.
	
	self updateConnectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionWasConnectedByUser: aDBConnectionWasConnectedByUser [
	aDBConnectionWasConnectedByUser connectionDescription
		beUnchecked.
	
	self updateConnectionDescriptionsList
]

{ #category : #'announcement handling' }
DBConnectionDescriptionsListWidget2 >> connectionWasDisconnectedByUser: aDBConnectionWasDisconnectedByUser [
	aDBConnectionWasDisconnectedByUser connectionDescription
		beUnknown.
	
	self updateConnectionDescriptionsList
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
DBConnectionDescriptionsListWidget2 >> initializePresenters [
	connectionDescriptionsList := self newTable.
	connectionDescriptionsList
		addColumn: (SpImageTableColumn title: 'Status' evaluated: [ :connectionDescription | self iconNamed: connectionDescription iconState ]);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Database' evaluated: #databaseName);
		addColumn: (SpStringTableColumn title: 'Hostname' evaluated: #hostname);
		addColumn: (SpStringTableColumn title: 'Port' evaluated: #port);
		addColumn: (SpStringTableColumn title: 'User' evaluated: #userName).
		
	connectionDescriptionsList
		contextMenuFromCommandsGroup: [ self rootCommandsGroup ]
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> openWithSpec [
	super openWithSpec.
	
	self window
		whenClosedDo: [ self unsubscribeFromSubscribedTo ]
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> selectedConnectionDescription [
	^ self connectionDescriptionsList selection selectedItem
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

{ #category : #private }
DBConnectionDescriptionsListWidget2 >> updateConnectionDescriptionsList [
	| selectedItems |
	self flag: #TODO. "Dirty hack to make it work for now... Need to use Spec2 API when available."
	"selectedItems := self connectionDescriptionsList selectedItems.
	self connectionDescriptionsList
		items: self connectionDescriptionsList items;
		selectItems: selectedItems"
]

{ #category : #api }
DBConnectionDescriptionsListWidget2 >> whenSelectedItemChanged: aBlock [
	self connectionDescriptionsList
		whenSelectionChangedDo: [ :selection | aBlock cull: selection selectedItem ]
]
