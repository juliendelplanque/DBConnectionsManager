initialization
initializeWidgets
	newConnectionButton := self newButton.
	
	connectionDescriptionsList := self instantiate: DBConnectionDescriptionsListWidget.
	
	connectionDescriptionEditor := self instantiate: DBConnectionDescriptionWidget