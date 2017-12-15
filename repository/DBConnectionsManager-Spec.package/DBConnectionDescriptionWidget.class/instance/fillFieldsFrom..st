fields filling
fillFieldsFrom: aDBConnectionDescription
	self connectionNameInput text: aDBConnectionDescription name.

	self hostnameTextInput text: aDBConnectionDescription hostname.
	
	self databaseTextInput text: aDBConnectionDescription databaseName.
	
	self userTextInput text: aDBConnectionDescription userName.
	
	self passwordTextInput text: aDBConnectionDescription password.
	
	self portTextInput text: aDBConnectionDescription port asString