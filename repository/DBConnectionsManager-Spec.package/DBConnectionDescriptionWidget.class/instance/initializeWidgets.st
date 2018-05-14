initialization
initializeWidgets
	connectionNameLabel := self newLabel.
	connectionNameInput := self newTextInput.

	hostnameLabel := self newLabel.
	hostnameTextInput := self newTextInput.
	
	portLabel := self newLabel.
	portTextInput := self newTextInput.
	
	databaseLabel := self newLabel.
	databaseTextInput := self newTextInput.
	
	userLabel := self newLabel.
	userTextInput := self newTextInput.
	
	passwordLabel := self newLabel.
	passwordTextInput := self newTextInput.
	
	dbmsDropListLabel := self newLabel.
	dbmsDropList := self newDropList.
	
	okButton := self newButton.
	cancelButton := self newButton.
	testConnectionButton := self newButton