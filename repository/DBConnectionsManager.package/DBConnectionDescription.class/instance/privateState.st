accessing
privateState
	^ privateState ifNil: [ self resetPrivateState ]