initialization
initialize
	super initialize.
	self
		connections: OrderedCollection new;
		sleepTime: self defaultSleepTime.
		
	wasAliveDict := Dictionary new