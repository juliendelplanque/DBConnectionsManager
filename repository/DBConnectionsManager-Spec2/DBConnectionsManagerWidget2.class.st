Class {
	#name : #DBConnectionsManagerWidget2,
	#superclass : #SpPresenter,
	#instVars : [
		'newConnectionButton',
		'connectionDescriptionsList',
		'threadCheckerButton',
		'connectionsManager'
	],
	#category : #'DBConnectionsManager-Spec2-Spec'
}

{ #category : #specs }
DBConnectionsManagerWidget2 class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #newConnectionButton
			withConstraints: [ :constraint | constraint height: self buttonHeight ];
		add: #connectionDescriptionsList
			withConstraints: [ :constraint | constraint fill: true ];
		add: #threadCheckerButton
			withConstraints: [ :constraint | constraint height: self buttonHeight ];
		yourself
]

{ #category : #menu }
DBConnectionsManagerWidget2 class >> menuOn: aBuilder [
	<worldMenu>
	aBuilder withSeparatorAfter.
	
	(aBuilder item: #'DB Connections Manager Spec 2')
		iconName: #glamorousThrough;
		parent: #Tools;
		action: [ 
			self new
				adaptToConnectionsManager: DBConnectionsManager current;
				openWithSpec ].
		
	aBuilder withSeparatorAfter
]

{ #category : #settings }
DBConnectionsManagerWidget2 class >> systemSettingOn: aBuilder [
	<systemsettings>
	
	(aBuilder group: #DBConnectionsManager)
		label: 'DBConnectionsManager'
]

{ #category : #adapting }
DBConnectionsManagerWidget2 >> adaptToConnectionsManager: aDBConnectionsManager [
	connectionsManager := aDBConnectionsManager.
	
	aDBConnectionsManager announcer
		when: DBCurrentConnectionsManagerChanged send: #currentConnectionsManagerChanged: to: self.
	
	self threadCheckerButton
		label: self threadCheckerButtonLabel;
		icon: self threadCheckerButtonIcon;
		action: [	
			self toggleThreadCheckerState.
			self threadCheckerButton
				label: self threadCheckerButtonLabel;
				icon: self threadCheckerButtonIcon ].
	 
	self connectionDescriptionsList
		adaptToConnectionsManager: aDBConnectionsManager.
]

{ #category : #accessing }
DBConnectionsManagerWidget2 >> connectionDescriptionsList [
	^ connectionDescriptionsList
]

{ #category : #accessing }
DBConnectionsManagerWidget2 >> connectionsManager [
	^ connectionsManager
]

{ #category : #'announcement handling' }
DBConnectionsManagerWidget2 >> currentConnectionsManagerChanged: aDBCurrentConnectionsManagerChanged [
	aDBCurrentConnectionsManagerChanged oldConnectionManager announcer
		unsubscribe: self.
	self adaptToConnectionsManager: aDBCurrentConnectionsManagerChanged connectionsManager
]

{ #category : #api }
DBConnectionsManagerWidget2 >> initialExtent [
	^ 800@400
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initialize [
	super initialize.
	self
		initializeFocusOrder
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeConnectionButton [
	self newConnectionButton
		label: 'New connection';
		action: [ DBConnectionDescriptionWidget2 new
				okButtonAction: [ :widget | 
					connectionsManager add: widget asDBConnectionDescription.
					widget window close ];
				beForNewConnection;
				openWithSpec ]
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeFocusOrder [
	self focusOrder
		add: self newConnectionButton;
		add: self connectionDescriptionsList;
		add: self threadCheckerButton
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializePresenter [
	super initializePresenter.
	self
		initializeConnectionButton;
		initializeThreadCheckerButton
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeThreadCheckerButton [
	self threadCheckerButton
		label: 'No connections manager set'
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeWidgets [
	newConnectionButton := self newButton.
	
	connectionDescriptionsList := self instantiate: DBConnectionDescriptionsListWidget2.
	
	threadCheckerButton := self newButton
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'DB Connections Manager';
		windowIcon: (self iconNamed: #glamorousThrough)
]

{ #category : #accessing }
DBConnectionsManagerWidget2 >> newConnectionButton [
	^ newConnectionButton
]

{ #category : #api }
DBConnectionsManagerWidget2 >> openWithSpec [
	super openWithSpec.
	
	self window
		whenClosedDo: [ self unsubscribeFromConnectionsManager ]
]

{ #category : #accessing }
DBConnectionsManagerWidget2 >> selectedConnectionDescription [
	^ self connectionDescriptionsList selectedConnectionDescription
]

{ #category : #accessing }
DBConnectionsManagerWidget2 >> threadCheckerButton [
	^ threadCheckerButton
]

{ #category : #'thread checker' }
DBConnectionsManagerWidget2 >> threadCheckerButtonIcon [
	^ connectionsManager isCheckingConnections
		ifTrue: [ self iconNamed: #testGreen ]
		ifFalse: [ self iconNamed: #testRed ]
]

{ #category : #'thread checker' }
DBConnectionsManagerWidget2 >> threadCheckerButtonLabel [
	^ connectionsManager isCheckingConnections
		ifTrue: [ 'Checker is running, click to stop' ]
		ifFalse: [ 'Checker is not running, click to start' ]
]

{ #category : #'thread checker' }
DBConnectionsManagerWidget2 >> toggleThreadCheckerState [
	connectionsManager isCheckingConnections
		ifTrue: [ connectionsManager stopConnectionsChecking ]
		ifFalse: [ connectionsManager startConnectionsChecking ]
]

{ #category : #private }
DBConnectionsManagerWidget2 >> unsubscribeFromConnectionsManager [
	connectionsManager announcer unsubscribe: self.
	
	self connectionDescriptionsList
		unsubscribeFromSubscribedTo
]
