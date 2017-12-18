thread checker
threadCheckerButtonLabel
	^ connectionsManager isCheckingConnections
		ifTrue: [ 'Stop checking' ]
		ifFalse: [ 'Start checking' ]