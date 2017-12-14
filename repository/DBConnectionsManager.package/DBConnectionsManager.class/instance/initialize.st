initialization
initialize
	super initialize.
	self
		connections: OrderedCollection new;
		sleepTime: 5 seconds.
		
	wasAliveDict := Dictionary new