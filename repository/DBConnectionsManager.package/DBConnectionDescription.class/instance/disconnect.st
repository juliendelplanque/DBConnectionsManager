api
disconnect
	self connection
		ifNotNil: #close.
		
	self
		connection: nil;
		wasDisconnectedByUser: true