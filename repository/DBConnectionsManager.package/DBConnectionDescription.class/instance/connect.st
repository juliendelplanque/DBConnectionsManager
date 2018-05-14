api
connect
	(self connection isNotNil and: [ self connection isConnected ])
		ifTrue: [ ^ self ].
	connection := self buildConnection.
	connection dbcmConnect.
	self
		hasAlreadyConnect: true;
		wasDisconnectedByUser: false.
	self announcer
		announce: (DBConnectionWasConnectedByUser connectionDescription: self)