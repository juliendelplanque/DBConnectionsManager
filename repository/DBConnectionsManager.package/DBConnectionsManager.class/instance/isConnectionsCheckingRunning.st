testing
isConnectionsCheckingRunning
	^ connectionsCheckerThread isNotNil and: [ connectionsCheckerThread isTerminated not ]