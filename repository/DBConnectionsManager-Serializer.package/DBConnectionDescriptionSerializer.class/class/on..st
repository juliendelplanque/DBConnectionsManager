instance creation
on: aStream
	^ self new
		writeStream: aStream;
		yourself