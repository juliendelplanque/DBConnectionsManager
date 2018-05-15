"
I provide the UI letting a user creating a DBConnectionDescription.
"
Class {
	#name : #DBConnectionDescriptionWidget,
	#superclass : #ComposableModel,
	#instVars : [
		'hostnameLabel',
		'hostnameTextInput',
		'portLabel',
		'portTextInput',
		'userLabel',
		'userTextInput',
		'passwordLabel',
		'passwordTextInput',
		'databaseLabel',
		'databaseTextInput',
		'okButton',
		'cancelButton',
		'portTextInputRegex',
		'hostnameTextInputRegex',
		'databaseTextInputRegex',
		'userTextInputRegex',
		'passwordTextInputRegex',
		'connectionNameLabel',
		'connectionNameInput',
		'testConnectionButton',
		'dbmsDropList',
		'dbmsDropListLabel'
	],
	#classInstVars : [
		'defaultHostname',
		'defaultPort'
	],
	#category : #DBConnectionsManager-Spec-Widgets
}

{ #category : #defaults }
DBConnectionDescriptionWidget class >> defaultHostname [
	^ defaultHostname ifNil: [ defaultHostname := 'localhost' ]
]

{ #category : #defaults }
DBConnectionDescriptionWidget class >> defaultHostname: aString [
	^ defaultHostname := aString
]

{ #category : #defaults }
DBConnectionDescriptionWidget class >> defaultPort [
	^ defaultPort ifNil: [ defaultPort := 5432 ]
]

{ #category : #defaults }
DBConnectionDescriptionWidget class >> defaultPort: anInteger [
	^ defaultPort := anInteger
]

{ #category : #specs }
DBConnectionDescriptionWidget class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: [ :row |
					row
						add: #connectionNameLabel;
						add: #connectionNameInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #hostnameLabel;
						add: #hostnameTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #portLabel;
						add: #portTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #databaseLabel;
						add: #databaseTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #userLabel;
						add: #userTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #passwordLabel;
						add: #passwordTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #dbmsDropListLabel;
						add: #dbmsDropList ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #testConnectionButton;
						add: #cancelButton;
						add: #okButton ] height: self buttonHeight ]
]

{ #category : #settings }
DBConnectionDescriptionWidget class >> systemSettingOn: aBuilder [
	<systemsettings>
	
	(aBuilder setting: #defaultHostname)
		parent: #DBConnectionsManager;
		target: self;
		label: 'Default hostname';
		description: 'Default value for the hostname field in a connection decription.';
		type: #String.
	(aBuilder setting: #defaultPort)
		parent: #DBConnectionsManager;
		target: self;
		label: 'Default port number';
		description: 'Default value for the port number field in a connection description.';
		type: #Integer.
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> adaptToMyself: aDBConnectionDescription [
	"Set the instance variables of #aDBConnectionDescription to match my values."
	self checkInputsMatchRegexes.
	
	^ aDBConnectionDescription
		name: self connectionName;
		hostname: self hostname;
		databaseName: self database;
		userName: self user;
		password: self password;
		yourself.
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> asDBConnectionDescription [
	"Return a new DBConnectionDescription instance adapted to what is in my input fields."
	^ self adaptToMyself: (DBConnectionDescription for: self dbmsDropList selectedItem new)
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> beForNewConnection [
	hostnameTextInput
		text: self class defaultHostname.
	portTextInput
		text: self class defaultPort asString
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> cancelButton [
	^ cancelButton
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> cancelButtonAction: aBlock [
	cancelButton
		action: [ 
			[
				aBlock cull: self
			] on: Error do: [ :err | UIManager default alert: err messageText title: 'Error while cancelling.' ] ]
]

{ #category : #validation }
DBConnectionDescriptionWidget >> checkInputsMatchRegexes [
	(self hostnameTextInput text matchesRegex: self hostnameTextInputRegex)
		ifFalse: [ self error: 'Input for hostname is malformed.' ].

	(self portTextInput text matchesRegex: self portTextInputRegex)
		ifFalse: [ self error: 'Input for port number is malformed.' ].
		
	(self databaseTextInput text matchesRegex: self databaseTextInputRegex)
		ifFalse: [ self error: 'Input for database name is malformed.' ].
		
	(self userTextInput text matchesRegex: self userTextInputRegex)
		ifFalse: [ self error: 'Input for user name is malformed.' ].
		
	(self passwordTextInput text matchesRegex: self passwordTextInputRegex)
		ifFalse: [ self error: 'Input for password is malformed.' ]
]

{ #category : #'fields filling' }
DBConnectionDescriptionWidget >> clearFields [
	self connectionNameInput text: ''.

	self hostnameTextInput text: ''.
	
	self databaseTextInput text: ''.
	
	self userTextInput text: ''.
	
	self passwordTextInput text: ''.
	
	self portTextInput text: ''
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> connectionName [
	^ connectionNameInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> connectionNameInput [
	^ connectionNameInput
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> connectionNameLabel [
	^ connectionNameLabel
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> database [
	^ databaseTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> databaseLabel [
	^ databaseLabel
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> databaseTextInput [
	^ databaseTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> databaseTextInputRegex [
	^ databaseTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> databaseTextInputRegex: anObject [
	databaseTextInputRegex := anObject
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> dbmsDropList [
	^ dbmsDropList
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> dbmsDropListLabel [
	^ dbmsDropListLabel
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> enabled: aBoolean [
	self connectionNameInput enabled: aBoolean.

	self hostnameTextInput enabled: aBoolean.
	
	self databaseTextInput enabled: aBoolean.
	
	self userTextInput enabled: aBoolean.
	
	self passwordTextInput enabled: aBoolean.
	
	self portTextInput enabled: aBoolean.
	
	self dbmsDropList enabled: aBoolean.
	
	self testConnectionButton enabled: aBoolean.
	
	self cancelButton enabled: aBoolean.
	
	self okButton enabled: aBoolean
]

{ #category : #'fields filling' }
DBConnectionDescriptionWidget >> fillFieldsFrom: aDBConnectionDescription [
	self connectionNameInput text: aDBConnectionDescription name.

	self hostnameTextInput text: aDBConnectionDescription hostname.
	
	self databaseTextInput text: aDBConnectionDescription databaseName.
	
	self userTextInput text: aDBConnectionDescription userName.
	
	self passwordTextInput text: aDBConnectionDescription password.
	
	self portTextInput text: aDBConnectionDescription port asString
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> hostname [
	^ hostnameTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> hostnameLabel [
	^ hostnameLabel
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> hostnameTextInput [
	^ hostnameTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> hostnameTextInputRegex [
	^ hostnameTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> hostnameTextInputRegex: anObject [
	hostnameTextInputRegex := anObject
]

{ #category : #initialization }
DBConnectionDescriptionWidget >> initialize [
	super initialize.
	self
		initializeFocusOrder;
		title: 'Connection Description';
		hostnameTextInputRegex: '.+';
		portTextInputRegex: '\d\d\d\d';
		databaseTextInputRegex: '.+';
		userTextInputRegex: '.+';
		passwordTextInputRegex: '.+'
]

{ #category : #initialization }
DBConnectionDescriptionWidget >> initializeFocusOrder [
	self focusOrder
		add: self connectionNameInput;
		add: self hostnameTextInput;
		add: self portTextInput;
		add: self databaseTextInput;
		add: self userTextInput;
		add: self passwordTextInput;
		add: self testConnectionButton;
		add: self cancelButton;
		add: self okButton
]

{ #category : #initialization }
DBConnectionDescriptionWidget >> initializePresenter [
	connectionNameLabel
		label: 'Connection name:'.
	connectionNameInput
		autoAccept: true;
		ghostText: 'my_connection'.
	
	hostnameLabel
		label: 'Hostname:'.
	hostnameTextInput
		autoAccept: true;
		ghostText: 'ip address/localhost/...'.
	
	portLabel
		label: 'Port:'.
	portTextInput 
		autoAccept: true;
		ghostText: 'Port number e.g. 5432'.
	
	databaseLabel
		label: 'Database:'.
	databaseTextInput
		autoAccept: true;
		ghostText: 'my_database'.
	
	userLabel
		label: 'User:'.
	userTextInput
		autoAccept: true;
		ghostText: 'DBMS username'.
	
	passwordLabel
		label: 'Password:'.
	passwordTextInput
		beEncrypted
		autoAccept: true;
		ghostText: 'DBMS username''s password'.
		
	dbmsDropListLabel
		label: 'DBMS:'.
	dbmsDropList
		items: (DBDataBaseManagementSystem subclasses sorted: [ :a :b | a dbmsName < b dbmsName ]);
		displayBlock: [ :class | class dbmsName ].
		
	okButton
		label: 'Ok'.
		
	cancelButton
		label: 'Cancel';
		action: [ self window close ].
		
	testConnectionButton
		label: 'Test connection';
		action: [ self testConnection ]
]

{ #category : #initialization }
DBConnectionDescriptionWidget >> initializeWidgets [
	connectionNameLabel := self newLabel.
	connectionNameInput := self newTextInput.

	hostnameLabel := self newLabel.
	hostnameTextInput := self newTextInput.
	
	portLabel := self newLabel.
	portTextInput := self newTextInput.
	
	databaseLabel := self newLabel.
	databaseTextInput := self newTextInput.
	
	userLabel := self newLabel.
	userTextInput := self newTextInput.
	
	passwordLabel := self newLabel.
	passwordTextInput := self newTextInput.
	
	dbmsDropListLabel := self newLabel.
	dbmsDropList := self newDropList.
	
	okButton := self newButton.
	cancelButton := self newButton.
	testConnectionButton := self newButton
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> okButton [
	^ okButton
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> okButtonAction: aBlock [
	okButton
		action: [ 
			[
				self checkInputsMatchRegexes.
				aBlock cull: self
			] on: Error do: [ :err | UIManager default alert: err messageText title: 'Could not create the connection description' ] ]
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> password [
	^ passwordTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> passwordTextInput [
	^ passwordTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> passwordTextInputRegex [
	^ passwordTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> passwordTextInputRegex: anObject [
	passwordTextInputRegex := anObject
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> port [
	^ portTextInput text asInteger
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> portLabel [
	^ portLabel
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> portTextInput [
	^ portTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> portTextInputRegex [
	^ portTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> portTextInputRegex: anObject [
	portTextInputRegex := anObject
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> testConnection [
	[ self asDBConnectionDescription
		connect;
		test;
		disconnect
	] on: Error do: [ :error | UIManager default alert: error messageText title: 'Connection test failed.'. ^ self ].

	UIManager default proceed: 'Connection works perfectly.' title: 'Connection test result'
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> testConnectionButton [
	^ testConnectionButton
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> user [
	^ userTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> userLabel [
	^ userLabel
]

{ #category : #accessing }
DBConnectionDescriptionWidget >> userTextInput [
	^ userTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> userTextInputRegex [
	^ userTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget >> userTextInputRegex: anObject [
	userTextInputRegex := anObject
]
