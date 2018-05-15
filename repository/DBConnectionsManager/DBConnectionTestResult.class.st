"
I am the result of a connection test.

I hold the start date and time of the test, its end date and time and if the connection was alive or not.
"
Class {
	#name : #DBConnectionTestResult,
	#superclass : #Object,
	#instVars : [
		'startTime',
		'endTime',
		'isAlive'
	],
	#category : 'DBConnectionsManager-Core'
}

{ #category : #accessing }
DBConnectionTestResult >> duration [
	^ self endTime - self startTime
]

{ #category : #accessing }
DBConnectionTestResult >> endTime [
	^ endTime
]

{ #category : #accessing }
DBConnectionTestResult >> endTime: anObject [
	endTime := anObject
]

{ #category : #accessing }
DBConnectionTestResult >> isAlive [
	^ isAlive
]

{ #category : #accessing }
DBConnectionTestResult >> isAlive: anObject [
	isAlive := anObject
]

{ #category : #printing }
DBConnectionTestResult >> printOn: aStream [
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
]

{ #category : #accessing }
DBConnectionTestResult >> startTime [
	^ startTime
]

{ #category : #accessing }
DBConnectionTestResult >> startTime: anObject [
	startTime := anObject
]
