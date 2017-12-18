connections accessing
connectionNamed: aString
	^ self connections detect: [ :connectionDescription |
		connectionDescription name = aString ]