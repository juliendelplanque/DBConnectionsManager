thread checker
threadCheckerButtonIcon
	^ connectionsManager isCheckingConnections
		ifTrue: [ Smalltalk ui icons iconNamed: #testGreen ]
		ifFalse: [ Smalltalk ui icons iconNamed: #testRed ]