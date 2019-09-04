Class {
	#name : #DBConnectionDescriptionWidget2,
	#superclass : #SpPresenter,
	#instVars : [
		'hostnameTextInput',
		'portTextInput',
		'userTextInput',
		'passwordTextInput',
		'databaseTextInput',
		'okButton',
		'cancelButton',
		'portTextInputRegex',
		'hostnameTextInputRegex',
		'databaseTextInputRegex',
		'userTextInputRegex',
		'passwordTextInputRegex',
		'connectionNameInput',
		'testConnectionButton',
		'dbmsDropList'
	],
	#classInstVars : [
		'defaultHostname',
		'defaultPort'
	],
	#category : #'DBConnectionsManager-Spec2'
}

{ #category : #defaults }
DBConnectionDescriptionWidget2 class >> defaultHostname [
	^ defaultHostname ifNil: [ defaultHostname := 'localhost' ]
]

{ #category : #defaults }
DBConnectionDescriptionWidget2 class >> defaultHostname: aString [
	^ defaultHostname := aString
]

{ #category : #defaults }
DBConnectionDescriptionWidget2 class >> defaultPort [
	^ defaultPort ifNil: [ defaultPort := 5432 ]
]

{ #category : #defaults }
DBConnectionDescriptionWidget2 class >> defaultPort: anInteger [
	^ defaultPort := anInteger
]

{ #category : #specs }
DBConnectionDescriptionWidget2 class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
				add: 'Connection name:';
				add: #connectionNameInput;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: 'Hostname:';
				add: #hostnameTextInput;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: 'Port:';
				add: #portTextInput;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: 'Database:';
				add: #databaseTextInput;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: 'User:';
				add: #userTextInput;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: 'Password:';
				add: #passwordTextInput;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: 'DBMS:';
				add: #dbmsDropList;
				yourself);
		add: (SpBoxLayout newHorizontal
				add: #testConnectionButton;
				add: #cancelButton;
				add: #okButton;
				yourself);
		yourself
]

{ #category : #settings }
DBConnectionDescriptionWidget2 class >> systemSettingOn: aBuilder [
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
DBConnectionDescriptionWidget2 >> adaptToMyself: aDBConnectionDescription [
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
DBConnectionDescriptionWidget2 >> asDBConnectionDescription [
	"Return a new DBConnectionDescription instance adapted to what is in my input fields."
	^ self adaptToMyself: (DBConnectionDescription for: self dbmsDropList selectedItem new)
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> beForNewConnection [
	hostnameTextInput
		text: self class defaultHostname.
	portTextInput
		text: self class defaultPort asString
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> cancelButton [
	^ cancelButton
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> cancelButtonAction: aBlock [
	cancelButton
		action: [ 
			[
				aBlock cull: self
			] on: Error do: [ :err | UIManager default alert: err messageText title: 'Error while cancelling.' ] ]
]

{ #category : #validation }
DBConnectionDescriptionWidget2 >> checkInputsMatchRegexes [
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
DBConnectionDescriptionWidget2 >> clearFields [
	self connectionNameInput text: ''.

	self hostnameTextInput text: ''.
	
	self databaseTextInput text: ''.
	
	self userTextInput text: ''.
	
	self passwordTextInput text: ''.
	
	self portTextInput text: ''
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> connectionName [
	^ connectionNameInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> connectionNameInput [
	^ connectionNameInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> database [
	^ databaseTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> databaseTextInput [
	^ databaseTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> databaseTextInputRegex [
	^ databaseTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> databaseTextInputRegex: anObject [
	databaseTextInputRegex := anObject
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> dbmsDropList [
	^ dbmsDropList
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> enabled: aBoolean [
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
DBConnectionDescriptionWidget2 >> fillFieldsFrom: aDBConnectionDescription [
	aDBConnectionDescription fillConnectionDescriptionWidget: self
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> hostname [
	^ hostnameTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> hostnameTextInput [
	^ hostnameTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> hostnameTextInputRegex [
	^ hostnameTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> hostnameTextInputRegex: anObject [
	hostnameTextInputRegex := anObject
]

{ #category : #initialization }
DBConnectionDescriptionWidget2 >> initialize [
	super initialize.
	self
		initializeFocusOrder;
		hostnameTextInputRegex: '.+';
		portTextInputRegex: '\d\d\d\d';
		databaseTextInputRegex: '.+';
		userTextInputRegex: '.+';
		passwordTextInputRegex: '.+'
]

{ #category : #initialization }
DBConnectionDescriptionWidget2 >> initializeFocusOrder [
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
DBConnectionDescriptionWidget2 >> initializePresenter [
	connectionNameInput
		autoAccept: true;
		placeholder: 'my_connection'.
	hostnameTextInput
		autoAccept: true;
		placeholder: 'ip address/localhost/...'.
	portTextInput
		autoAccept: true;
		placeholder: 'Port number e.g. 5432'.
	databaseTextInput
		autoAccept: true;
		placeholder: 'my_database'.
	userTextInput
		autoAccept: true;
		placeholder: 'DBMS username'.
	passwordTextInput bePassword
		autoAccept: true;
		placeholder: 'DBMS username''s password'.
	dbmsDropList
		items:
			(DBDataBaseManagementSystem subclasses
				sorted: [ :a :b | a dbmsName < b dbmsName ]);
		display: [ :class | class dbmsName ].
	okButton label: 'Ok'.
	cancelButton
		label: 'Cancel';
		action: [ self window close ].
	testConnectionButton
		label: 'Test connection';
		action: [ self testConnection ]
]

{ #category : #initialization }
DBConnectionDescriptionWidget2 >> initializeWidgets [
	connectionNameInput := self newTextInput.
	hostnameTextInput := self newTextInput.
	portTextInput := self newTextInput.
	databaseTextInput := self newTextInput.
	userTextInput := self newTextInput.
	passwordTextInput := self newTextInput.
	dbmsDropList := self newDropList.
	
	okButton := self newButton.
	cancelButton := self newButton.
	testConnectionButton := self newButton
]

{ #category : #initialization }
DBConnectionDescriptionWidget2 >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	aWindowPresenter title: 'Connection Description'
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> okButton [
	^ okButton
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> okButtonAction: aBlock [
	okButton
		action: [ 
			[
				self checkInputsMatchRegexes.
				aBlock cull: self
			] on: Error do: [ :err | UIManager default alert: err messageText title: 'Could not create the connection description' ] ]
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> password [
	^ passwordTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> passwordTextInput [
	^ passwordTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> passwordTextInputRegex [
	^ passwordTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> passwordTextInputRegex: anObject [
	passwordTextInputRegex := anObject
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> port [
	^ portTextInput text asInteger
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> portTextInput [
	^ portTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> portTextInputRegex [
	^ portTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> portTextInputRegex: anObject [
	portTextInputRegex := anObject
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> testConnection [
	[ self asDBConnectionDescription
		connect;
		test;
		disconnect
	] on: Error do: [ :error | UIManager default alert: error messageText title: 'Connection test failed.'. ^ self ].

	UIManager default proceed: 'Connection works perfectly.' title: 'Connection test result'
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> testConnectionButton [
	^ testConnectionButton
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> user [
	^ userTextInput text
]

{ #category : #accessing }
DBConnectionDescriptionWidget2 >> userTextInput [
	^ userTextInput
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> userTextInputRegex [
	^ userTextInputRegex
]

{ #category : #'public api' }
DBConnectionDescriptionWidget2 >> userTextInputRegex: anObject [
	userTextInputRegex := anObject
]
