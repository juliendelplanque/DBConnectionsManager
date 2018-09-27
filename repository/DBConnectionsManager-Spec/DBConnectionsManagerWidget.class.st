"
I am the widget allowing to manage a DBConnectionsManager.

I provide a UI to show the list of connection descriptions, to add or remove them, to test them and to control the connection checker thread.
"
Class {
	#name : #DBConnectionsManagerWidget,
	#superclass : #ComposableModel,
	#instVars : [
		'newConnectionButton',
		'connectionDescriptionsList',
		'connectionDescriptionEditor',
		'threadCheckerButton',
		'connectionsManager'
	],
	#category : 'DBConnectionsManager-Spec-Widgets'
}

{ #category : #specs }
DBConnectionsManagerWidget class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :mainRow |
			mainRow
				newColumn: [ :leftColumn |
					leftColumn
						newRow: #newConnectionButton height: self buttonHeight;
						newRow: #connectionDescriptionsList;
						newRow: #threadCheckerButton height: self buttonHeight ];
				addSplitter;
				newColumn: #connectionDescriptionEditor ]
]

{ #category : #menu }
DBConnectionsManagerWidget class >> menuOn: aBuilder [
	<worldMenu>
	aBuilder withSeparatorAfter.
	
	(aBuilder item: #'DB Connections Manager')
		iconName: #glamorousThrough;
		parent: #Tools;
		action: [ 
			self new
				adaptToConnectionsManager: DBConnectionsManager current;
				openWithSpec ].
		
	aBuilder withSeparatorAfter
]

{ #category : #settings }
DBConnectionsManagerWidget class >> systemSettingOn: aBuilder [
	<systemsettings>
	
	(aBuilder group: #DBConnectionsManager)
		label: 'DBConnectionsManager'
]

{ #category : #adapting }
DBConnectionsManagerWidget >> adaptToConnectionsManager: aDBConnectionsManager [
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
DBConnectionsManagerWidget >> buildAllConnectionsListMenuOn: builder [
	self buildListMenuFor: DBConnectionsManagerWidgetCommand subclassesForAllConnections on: builder
]

{ #category : #'list menu' }
DBConnectionsManagerWidget >> buildConnectionSpecificListMenuOn: builder [
	self buildListMenuFor: DBConnectionsManagerWidgetCommand subclassesForSingleConnection on: builder
]

{ #category : #'list menu' }
DBConnectionsManagerWidget >> buildListMenuFor: aCollectionOfCommandClasses on: builder [
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
DBConnectionsManagerWidget >> buildListMenuOn: builder [
	self connectionDescriptionsList selectedConnectionDescription
		ifNotNil: [ self buildConnectionSpecificListMenuOn: builder ].
	builder addLine.
	self buildAllConnectionsListMenuOn: builder
]

{ #category : #accessing }
DBConnectionsManagerWidget >> connectionDescriptionEditor [
	^ connectionDescriptionEditor
]

{ #category : #accessing }
DBConnectionsManagerWidget >> connectionDescriptionsList [
	^ connectionDescriptionsList
]

{ #category : #accessing }
DBConnectionsManagerWidget >> connectionsManager [
	^ connectionsManager
]

{ #category : #'announcement handling' }
DBConnectionsManagerWidget >> currentConnectionsManagerChanged: aDBCurrentConnectionsManagerChanged [
	aDBCurrentConnectionsManagerChanged oldConnectionManager announcer
		unsubscribe: self.
	self adaptToConnectionsManager: aDBCurrentConnectionsManagerChanged connectionsManager
]

{ #category : #api }
DBConnectionsManagerWidget >> initialExtent [
	^ 800@400
]

{ #category : #initialization }
DBConnectionsManagerWidget >> initialize [
	super initialize.
	self
		initializeFocusOrder;
		title: 'DB Connections Manager';
		windowIcon: (Smalltalk ui iconNamed: #glamorousThrough)
]

{ #category : #initialization }
DBConnectionsManagerWidget >> initializeConnectionButton [
	self newConnectionButton
		label: 'New connection';
		action: [ DBConnectionDescriptionWidget new
				okButtonAction: [ :widget | 
					connectionsManager add: widget asDBConnectionDescription.
					widget window close ];
				beForNewConnection;
				openWithSpec ]
]

{ #category : #initialization }
DBConnectionsManagerWidget >> initializeConnectionDescriptionEditor [
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
DBConnectionsManagerWidget >> initializeConnectionDescriptionsList [
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
DBConnectionsManagerWidget >> initializeFocusOrder [
	self focusOrder
		add: self newConnectionButton;
		add: self connectionDescriptionsList;
		add: self threadCheckerButton;
		add: self connectionDescriptionEditor
]

{ #category : #initialization }
DBConnectionsManagerWidget >> initializePresenter [
	super initializePresenter.
	self
		initializeConnectionButton;
		initializeConnectionDescriptionsList;
		initializeConnectionDescriptionEditor;
		initializeThreadCheckerButton
]

{ #category : #initialization }
DBConnectionsManagerWidget >> initializeThreadCheckerButton [
	self threadCheckerButton
		label: 'No connections manager set'
]

{ #category : #initialization }
DBConnectionsManagerWidget >> initializeWidgets [
	newConnectionButton := self newButton.
	
	connectionDescriptionsList := self instantiate: DBConnectionDescriptionsListWidget.
	
	connectionDescriptionEditor := self instantiate: DBConnectionDescriptionWidget.
	
	threadCheckerButton := self newButton
]

{ #category : #accessing }
DBConnectionsManagerWidget >> newConnectionButton [
	^ newConnectionButton
]

{ #category : #api }
DBConnectionsManagerWidget >> openWithSpec [
	super openWithSpec.
	
	self window
		whenClosedDo: [ self unsubscribeFromConnectionsManager ]
]

{ #category : #accessing }
DBConnectionsManagerWidget >> selectedConnectionDescription [
	^ self connectionDescriptionsList selectedConnectionDescription
]

{ #category : #accessing }
DBConnectionsManagerWidget >> threadCheckerButton [
	^ threadCheckerButton
]

{ #category : #'thread checker' }
DBConnectionsManagerWidget >> threadCheckerButtonIcon [
	^ connectionsManager isCheckingConnections
		ifTrue: [ Smalltalk ui icons iconNamed: #testGreen ]
		ifFalse: [ Smalltalk ui icons iconNamed: #testRed ]
]

{ #category : #'thread checker' }
DBConnectionsManagerWidget >> threadCheckerButtonLabel [
	^ connectionsManager isCheckingConnections
		ifTrue: [ 'Checker is running, click to stop' ]
		ifFalse: [ 'Checker is not running, click to start' ]
]

{ #category : #'thread checker' }
DBConnectionsManagerWidget >> toggleThreadCheckerState [
	connectionsManager isCheckingConnections
		ifTrue: [ connectionsManager stopConnectionsChecking ]
		ifFalse: [ connectionsManager startConnectionsChecking ]
]

{ #category : #private }
DBConnectionsManagerWidget >> unsubscribeFromConnectionsManager [
	connectionsManager announcer unsubscribe: self.
	
	self connectionDescriptionsList
		unsubscribeFromSubscribedTo
]
