public api
asDBConnectionDescription
	^ (DBConnectionDescription for: DBPostgreSQLDBMS new)
		name: self connectionName;
		hostname: self hostname;
		databaseName: self database;
		userName: self user;
		password: self password;
		yourself.