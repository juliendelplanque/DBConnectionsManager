connections checking
checkConnection: connectionDescription
	| testResult |
	connectionDescription wasDisconnectedByUser
		ifTrue: [
			wasAliveDict at: connectionDescription put: false.
			^ self ].
	
	testResult := connectionDescription test.
	
	(testResult isAlive not and: [ connectionDescription hasAlreadyConnect ])
		ifTrue: [ 
			[ connectionDescription connect ] on: Error do: [ "Do nothing." ].
			testResult := connectionDescription test
		].
	
	(testResult isAlive and: [ (self wasAlive: connectionDescription) not ])
		ifTrue: [ self announceConnectionRevive: connectionDescription withTestResult: testResult ].
	
	(testResult isAlive not and: [ self wasAlive: connectionDescription ])
		ifTrue: [ self announceConnectionDied: connectionDescription withTestResult: testResult ].
		
	(testResult isAlive and: [ self wasAlive: connectionDescription ])
		ifTrue: [ self announceConnectionStillAlive: connectionDescription withTestResult: testResult ].
	
	wasAliveDict at: connectionDescription put: testResult isAlive