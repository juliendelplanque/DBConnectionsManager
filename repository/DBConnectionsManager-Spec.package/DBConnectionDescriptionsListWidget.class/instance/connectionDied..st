announcement handling
connectionDied: aDBConnectionDied

	aDBConnectionDied connectionDescription beDead.
	
	self connectionDescriptionsList refreshListItems.
	
	UIManager default inform: 'Died'