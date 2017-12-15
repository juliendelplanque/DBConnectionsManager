adding/removing
add: aDBConnectionDescription
	self connections add: aDBConnectionDescription.
	self announceConnectionDescriptionAdded: aDBConnectionDescription.
	
	wasAliveDict at: aDBConnectionDescription put: false.
	
	aDBConnectionDescription announcer
		when: DBConnectionDescriptionAnnouncement send: #forwardAnnouncement: to: self