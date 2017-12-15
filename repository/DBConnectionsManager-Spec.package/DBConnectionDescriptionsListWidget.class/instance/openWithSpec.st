api
openWithSpec
	super openWithSpec.
	
	self window
		whenClosedDo: [ self unsubscribeFromSubscribedTo ]