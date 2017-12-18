thread checker
threadCheckerButtonLabel
	^ connectionsManager isCheckingConnections
		ifTrue: [ 'Checker is running, click to stop' ]
		ifFalse: [ 'Checker is not running, click to start' ]