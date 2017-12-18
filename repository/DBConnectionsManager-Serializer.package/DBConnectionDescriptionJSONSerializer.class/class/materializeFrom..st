materializing
materializeFrom: aString
	| dict |
	dict := STONJSON fromString: aString.
	
	^ DBConnectionDescription new
		name: (dict at: 'name');
		hostname: (dict at: 'hostname');
		databaseName: (dict at: 'databaseName');
		userName: (dict at: 'userName');
		password: (dict at: 'password');
		dbms: (DBDataBaseManagementSystem dbmsNamed: (dict at: 'dbms') );
		yourself