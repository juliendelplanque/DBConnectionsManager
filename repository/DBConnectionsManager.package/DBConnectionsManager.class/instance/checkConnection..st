connections checking
checkConnection: connectionDescription
	| isAlive |
	isAlive := connectionDescription isAlive.
	
	(isAlive and: [ (self wasAlive: connectionDescription) not ])
		ifTrue: [ self announceConnectionRevive: connectionDescription ].
	
	(isAlive not and: [ self wasAlive: connectionDescription ])
		ifTrue: [ self announceConnectionDied: connectionDescription ].
	
	wasAliveDict at: connectionDescription put: isAlive