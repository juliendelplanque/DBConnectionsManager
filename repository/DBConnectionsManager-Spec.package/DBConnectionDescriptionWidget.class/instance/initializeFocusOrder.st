initialization
initializeFocusOrder
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