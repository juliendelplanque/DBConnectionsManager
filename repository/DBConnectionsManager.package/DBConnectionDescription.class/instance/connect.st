api
connect
	(self connection isNotNil and: [ self connection isConnected ])
		ifTrue: [ ^ self ].
	
	connection := GADriver fromConnectionString: self connectionUrl.
	connection dbcmConnect.
	
	self
		hasAlreadyConnect: true;
		wasDisconnectedByUser: false.
		
	self announcer announce: (DBConnectionWasConnectedByUser connectionDescription: self)