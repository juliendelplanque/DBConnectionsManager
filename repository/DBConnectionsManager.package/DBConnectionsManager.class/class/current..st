accessing
current: aDBConnectionsManager.
	current ifNotNil: [ 
		current announcer
			announce: (DBCurrentConnectionsManagerChanged new
							connectionsManager: aDBConnectionsManager;
							oldConnectionManager: current;
							yourself) ].
	current := aDBConnectionsManager