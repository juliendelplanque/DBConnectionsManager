thread checker
toggleThreadCheckerState
	connectionsManager isCheckingConnections
		ifTrue: [ connectionsManager stopConnectionsChecking ]
		ifFalse: [ connectionsManager startConnectionsChecking ]