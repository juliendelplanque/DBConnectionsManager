initialization
initializePresenter
	newConnectionButton
		label: 'New connection'.
	
	connectionDescriptionsList
		displayBlock: [ :connectionDescription | connectionDescription name ];
		icons: [ :connectionDescription | Smalltalk ui iconNamed: connectionDescription iconState ]