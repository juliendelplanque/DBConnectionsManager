adapting
adaptToConnectionsManager: aDBConnectionsManager
	connectionsManager := aDBConnectionsManager.
	
	aDBConnectionsManager announcer
		when: DBCurrentConnectionsManagerChanged send: #currentConnectionsManagerChanged: to: self.
	
	self threadCheckerButton
		label: self threadCheckerButtonLabel;
		action: [	
			self toggleThreadCheckerState.
			self threadCheckerButton
				label: self threadCheckerButtonLabel ].
	 
	self connectionDescriptionsList
		adaptToConnectionsManager: aDBConnectionsManager.