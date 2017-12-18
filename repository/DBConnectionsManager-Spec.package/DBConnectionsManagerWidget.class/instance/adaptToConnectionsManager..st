adapting
adaptToConnectionsManager: aDBConnectionsManager
	connectionsManager := aDBConnectionsManager.
	
	self threadCheckerButton
		label: self threadCheckerButtonLabel;
		action: [	
			self toggleThreadCheckerState.
			self threadCheckerButton
				label: self threadCheckerButtonLabel ].
	 
	self connectionDescriptionsList
		adaptToConnectionsManager: aDBConnectionsManager.