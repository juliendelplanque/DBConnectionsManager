api
disconnect
	(self connection isNotNil and: [ self connection isConnected ])
		ifFalse: [ ^ self ].
	
	self connection close.
	self
		connection: nil;
		wasDisconnectedByUser: true.
		
	self announcer announce: (DBConnectionWasDisconnectedByUser connectionDescription: self)