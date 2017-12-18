list menu
removeAllConnections
	DBRemoveAllCommand new
		connectionsManagerWidget: self;
		execute