validation
checkInputsMatchRegexes
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