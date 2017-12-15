initialization
initialize
	super initialize.
	self
		title: 'Connection Description';
		hostnameTextInputRegex: '.+';
		portTextInputRegex: '\d\d\d\d';
		databaseTextInputRegex: '.+';
		userTextInputRegex: '.+';
		passwordTextInputRegex: '.+'