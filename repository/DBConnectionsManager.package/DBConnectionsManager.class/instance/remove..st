adding/removing
remove: aDBConnectionDescription
	self connections remove: aDBConnectionDescription.
	self announceConnectionDescriptionRemoved: aDBConnectionDescription.
	
	wasAliveDict removeKey: aDBConnectionDescription.
	
	aDBConnectionDescription announcer
		unsubscribe: self