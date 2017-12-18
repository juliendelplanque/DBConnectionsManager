list menu
removeSelectedConnection
	DBRemoveSelectedCommand new
		connectionsManagerWidget: self;
		execute