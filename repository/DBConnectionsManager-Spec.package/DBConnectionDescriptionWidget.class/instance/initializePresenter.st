initialization
initializePresenter
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