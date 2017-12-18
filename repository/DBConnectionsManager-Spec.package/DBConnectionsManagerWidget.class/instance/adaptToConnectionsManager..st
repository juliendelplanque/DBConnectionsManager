adapting
adaptToConnectionsManager: aDBConnectionsManager
	connectionsManager := aDBConnectionsManager.
	 
	self connectionDescriptionsList
		adaptToConnectionsManager: aDBConnectionsManager