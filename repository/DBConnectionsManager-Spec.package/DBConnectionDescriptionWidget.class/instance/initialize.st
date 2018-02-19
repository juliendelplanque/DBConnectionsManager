initialization
initialize
	super initialize.
	self
		initializeFocusOrder;
		title: 'Connection Description';
		hostnameTextInputRegex: '.+';
		portTextInputRegex: '\d\d\d\d';
		databaseTextInputRegex: '.+';
		userTextInputRegex: '.+';
		passwordTextInputRegex: '.+'