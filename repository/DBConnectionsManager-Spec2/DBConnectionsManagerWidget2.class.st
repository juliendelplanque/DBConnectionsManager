Class {
	#name : #DBConnectionsManagerWidget2,
	#superclass : #SpPresenter,
	#instVars : [
		'newConnectionButton',
		'connectionDescriptionsList',
		'connectionDescriptionEditor',
		'threadCheckerButton',
		'connectionsManager'
	],
	#category : #'DBConnectionsManager-Spec2'
}

{ #category : #specs }
DBConnectionsManagerWidget2 class >> defaultSpec [
	^ SpPanedLayout newHorizontal
		add: (SpPanedLayout newVertical
				add: #newConnectionButton withConstraints: [ :constraint |
					constraint height: self buttonHeight ];
				add: #connectionDescriptionsList;
				add: #threadCheckerButton withConstraints: [ :constraint |
					constraint height: self buttonHeight ];
				yourself);
		addSplitter;
		add: #connectionDescriptionEditor;
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

{ #category : #'list menu' }
DBConnectionsManagerWidget2 >> buildAllConnectionsListMenuOn: builder [
	self buildListMenuFor: DBConnectionsManagerWidgetCommand subclassesForAllConnections on: builder
]

{ #category : #'list menu' }
DBConnectionsManagerWidget2 >> buildConnectionSpecificListMenuOn: builder [
	self buildListMenuFor: DBConnectionsManagerWidgetCommand subclassesForSingleConnection on: builder
]

{ #category : #'list menu' }
DBConnectionsManagerWidget2 >> buildListMenuFor: aCollectionOfCommandClasses on: builder [
	| categoriesDict |
	categoriesDict := aCollectionOfCommandClasses groupedBy: #menuCategory.
	categoriesDict
		at: #root
		ifPresent: [ :commands | 
			commands
				do: [ :commandClass | 
					builder
						add: commandClass commandName
						target: [ commandClass new
								connectionsManagerWidget: self;
								execute ]
						selector: #value ] ].
	categoriesDict
		removeKey: #root
		ifAbsent: [ "Do nothing on purpose." ].
	(categoriesDict associations sort: [ :a :b | a key < b key ])
		do: [ :assoc | 
			| subMenu |
			subMenu := MenuMorph new.
			assoc value
				do: [ :commandClass | 
					subMenu
						add: commandClass commandName
						target: [ commandClass new
								connectionsManagerWidget: self;
								execute ]
						selector: #value ].
			builder
				add: assoc key asCamelCase
				icon:
					(self iconNamed: #blank)
				subMenu: subMenu ]
]

{ #category : #'list menu' }
DBConnectionsManagerWidget2 >> buildListMenuOn: builder [
	self connectionDescriptionsList selectedConnectionDescription
		ifNotNil: [ self buildConnectionSpecificListMenuOn: builder ].
	builder addLine.
	self buildAllConnectionsListMenuOn: builder
]

{ #category : #accessing }
DBConnectionsManagerWidget2 >> connectionDescriptionEditor [
	^ connectionDescriptionEditor
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
		initializeFocusOrder;
		title: 'DB Connections Manager';
		windowIcon: (Smalltalk ui iconNamed: #glamorousThrough)
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
DBConnectionsManagerWidget2 >> initializeConnectionDescriptionEditor [
	self connectionDescriptionEditor
		enabled: false;
		okButtonAction: [ :editor | 
			| connectionDescription |
			connectionDescription := self connectionDescriptionsList
				selectedConnectionDescription.
			[ connectionDescription disconnect ]
				on: Error
				do: [ "Ignore, we just want to be sure it is disconnected." ].
			editor adaptToMyself: connectionDescription ];
		cancelButtonAction: [ :editor | 
			editor
				fillFieldsFrom: self connectionDescriptionsList selectedConnectionDescription ]
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeConnectionDescriptionsList [
	self connectionDescriptionsList
		whenSelectedItemChanged: [ :item | 
			item
				ifNotNil: [ self connectionDescriptionEditor
						enabled: true;
						fillFieldsFrom: item ]
				ifNil: [ self connectionDescriptionEditor
						enabled: false;
						clearFields ] ];
		buildMenuBlock: [ :builder | 
			self buildListMenuOn: builder ]
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializeFocusOrder [
	self focusOrder
		add: self newConnectionButton;
		add: self connectionDescriptionsList;
		add: self threadCheckerButton;
		add: self connectionDescriptionEditor
]

{ #category : #initialization }
DBConnectionsManagerWidget2 >> initializePresenter [
	super initializePresenter.
	self
		initializeConnectionButton;
		initializeConnectionDescriptionsList;
		initializeConnectionDescriptionEditor;
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
	
	connectionDescriptionEditor := self instantiate: DBConnectionDescriptionWidget2.
	
	threadCheckerButton := self newButton
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
		ifTrue: [ Smalltalk ui icons iconNamed: #testGreen ]
		ifFalse: [ Smalltalk ui icons iconNamed: #testRed ]
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