initialization
initializeConnectionButton
	self newConnectionButton
		label: 'New connection';
		action: [ DBConnectionDescriptionWidget new
				okButtonAction: [ :widget | 
					connectionsManager add: widget asDBConnectionDescription.
					widget window close ];
				beForNewConnection;
				openWithSpec ]