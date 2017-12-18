adding/removing
remove: aDBConnectionDescription
	self connections remove: aDBConnectionDescription.
	
	wasAliveDict removeKey: aDBConnectionDescription.
	
	aDBConnectionDescription announcer
		unsubscribe: self.
		
	self announceConnectionDescriptionRemoved: aDBConnectionDescription.