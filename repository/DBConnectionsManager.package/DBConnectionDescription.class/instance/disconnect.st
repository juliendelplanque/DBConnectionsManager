api
disconnect
	(self connection isNotNil and: [ self connection dbcmIsConnected ])
		ifFalse: [ ^ self ].
	
	self connection dbcmDisconnect.
	self
		connection: nil;
		wasDisconnectedByUser: true.
		
	self announcer announce: (DBConnectionWasDisconnectedByUser connectionDescription: self)