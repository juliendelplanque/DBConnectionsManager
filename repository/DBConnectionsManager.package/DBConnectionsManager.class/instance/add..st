adding/removing
add: aDBConnectionDescription
	self connections add: aDBConnectionDescription.
	
	wasAliveDict at: aDBConnectionDescription put: false.
	
	aDBConnectionDescription announcer
		when: DBConnectionDescriptionAnnouncement send: #forwardAnnouncement: to: self.
		
	self announceConnectionDescriptionAdded: aDBConnectionDescription.