adding/removing
add: aDBConnectionDescription
	self connections add: aDBConnectionDescription.
	self announceConnectionDescriptionAdded: aDBConnectionDescription.
	
	wasAliveDict at: aDBConnectionDescription put: false.
	
	aDBConnectionDescription announcer
		when: DBConnectionWasDisconnectedByUser send: #forwardAnnouncement: to: self