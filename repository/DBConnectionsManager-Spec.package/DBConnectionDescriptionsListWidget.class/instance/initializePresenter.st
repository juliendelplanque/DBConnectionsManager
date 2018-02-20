initialization
initializePresenter
	connectionDescriptionsList
		displayBlock: [ :connectionDescription | connectionDescription name ];
		icons: [ :connectionDescription | Smalltalk ui iconNamed: connectionDescription iconState ].
	
	self sortAlphabetically