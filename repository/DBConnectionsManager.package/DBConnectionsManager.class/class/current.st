accessing
current
	^ current ifNil: [ self resetCurrent ]