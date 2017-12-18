adding/removing
add: aDBConnectionDescription
	(self connections anySatisfy: [ :any | any name = aDBConnectionDescription name ])
		ifTrue: [ self error: 'The name of a connection description should be unique in all connections descriptions of a DBConnectionsManager.' ].
	self connections add: aDBConnectionDescription.
	
	wasAliveDict at: aDBConnectionDescription put: false.
	
	aDBConnectionDescription announcer
		when: DBConnectionDescriptionAnnouncement send: #forwardAnnouncement: to: self.
		
	self announceConnectionDescriptionAdded: aDBConnectionDescription.