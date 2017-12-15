connections checking
checkConnection: connectionDescription
	| isAlive |
	isAlive := connectionDescription isAlive.
	
	(isAlive not and: [ connectionDescription hasAlreadyConnect ])
		ifTrue: [ 
			[ connectionDescription connect ] on: Error do: [ "Do nothing." ].
			isAlive := connectionDescription isAlive
		].
	
	(isAlive and: [ (self wasAlive: connectionDescription) not ])
		ifTrue: [ self announceConnectionRevive: connectionDescription ].
	
	(isAlive not and: [ self wasAlive: connectionDescription ])
		ifTrue: [ self announceConnectionDied: connectionDescription ].
	
	wasAliveDict at: connectionDescription put: isAlive