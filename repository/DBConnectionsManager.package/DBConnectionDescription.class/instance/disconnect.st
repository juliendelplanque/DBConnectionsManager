api
disconnect
	self connection
		ifNotNil: #close.
		
	self
		connection: nil;
		wasDisconnectedByUser: true.
		
	self announcer announce: (DBConnectionWasDisconnectedByUser connectionDescription: self)