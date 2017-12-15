api
connect
	connection := GADriver fromConnectionString: self connectionUrl.
	connection connect.
	
	self
		hasAlreadyConnect: true;
		wasDisconnectedByUser: false.
		
	self announcer announce: (DBConnectionWasConnectedByUser connectionDescription: self)