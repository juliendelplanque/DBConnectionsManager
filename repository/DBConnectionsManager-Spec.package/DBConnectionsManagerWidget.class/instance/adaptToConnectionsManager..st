adapting
adaptToConnectionsManager: aDBConnectionsManager
	connectionsManager := aDBConnectionsManager.
	
	aDBConnectionsManager announcer
		when: DBCurrentConnectionsManagerChanged send: #currentConnectionsManagerChanged: to: self.
	
	self threadCheckerButton
		label: self threadCheckerButtonLabel;
		icon: self threadCheckerButtonIcon;
		action: [	
			self toggleThreadCheckerState.
			self threadCheckerButton
				label: self threadCheckerButtonLabel;
				icon: self threadCheckerButtonIcon ].
	 
	self connectionDescriptionsList
		adaptToConnectionsManager: aDBConnectionsManager.