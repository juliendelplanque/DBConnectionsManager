adapting
adaptToConnectionsManager: aDBConnectionsManager
	subscribedTo ifNotNil: [ 
		self unsubscribeFromSubscribedTo ].

	subscribedTo := aDBConnectionsManager.
	
	subscribedTo announcer
		when: DBConnectionDescriptionAdded send: #descriptionAdded: to: self;
		when: DBConnectionDescriptionRemoved send: #descriptionRemoved: to: self;
		when: DBConnectionDied send: #connectionDied: to: self;
		when: DBConnectionRevive send: #connectionRevive: to: self;
		when: DBConnectionWasDisconnectedByUser send: #connectionWasDisconnectedByUser: to: self;
		when: DBConnectionWasConnectedByUser send: #connectionWasConnectedByUser: to: self;
		when: DBConnectionsManagerStartedChecking send: #connectionsManagerStartedChecking: to: self;
		when: DBConnectionsManagerStoppedChecking send: #connectionsManagerStoppedChecking: to: self.
	
	connectionDescriptionsList
		items: aDBConnectionsManager connections