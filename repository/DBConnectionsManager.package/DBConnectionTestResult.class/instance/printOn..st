printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(.
		
	self isAlive
		ifTrue: [ aStream << 'Alive' ]
		ifFalse: [ aStream << 'Dead' ].
		
	aStream
		<< ' - '.
	
	self duration printOn: aStream.
	
	aStream
		<< $)