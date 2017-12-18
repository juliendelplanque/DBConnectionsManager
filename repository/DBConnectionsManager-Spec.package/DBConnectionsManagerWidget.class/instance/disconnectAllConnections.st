list menu
disconnectAllConnections
	DBDisconnectAllCommand new
		connectionsManagerWidget: self;
		execute