initialization
initialize
	super initialize.
	self
		initializeFocusOrder;
		title: 'DB Connections Manager';
		windowIcon: (Smalltalk ui iconNamed: #glamorousThrough)