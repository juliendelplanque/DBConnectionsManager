initialization
initializeFocusOrder
	self focusOrder
		add: self newConnectionButton;
		add: self connectionDescriptionsList;
		add: self threadCheckerButton;
		add: self connectionDescriptionEditor