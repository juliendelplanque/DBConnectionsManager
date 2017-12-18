private
unsubscribeFromConnectionsManager
	connectionsManager announcer unsubscribe: self.
	
	self connectionDescriptionsList
		unsubscribeFromSubscribedTo