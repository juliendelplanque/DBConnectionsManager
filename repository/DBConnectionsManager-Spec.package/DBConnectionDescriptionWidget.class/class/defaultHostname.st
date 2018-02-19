defaults
defaultHostname
	^ defaultHostname ifNil: [ defaultHostname := 'localhost' ]