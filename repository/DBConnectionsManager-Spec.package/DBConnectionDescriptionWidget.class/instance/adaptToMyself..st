public api
adaptToMyself: aDBConnectionDescription
	"Set the instance variables of #aDBConnectionDescription to match my values."
	self checkInputsMatchRegexes.
	
	^ aDBConnectionDescription
		name: self connectionName;
		hostname: self hostname;
		databaseName: self database;
		userName: self user;
		password: self password;
		yourself.