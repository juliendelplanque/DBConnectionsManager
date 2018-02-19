defaults
defaultPort
	^ defaultPort ifNil: [ defaultPort := 5432 ]