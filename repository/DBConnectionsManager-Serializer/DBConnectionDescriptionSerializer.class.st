"
I am an abstract serializer for a DBConnectionDescription.

My subclasses should be concrete and implement my instance side method #serialize:
and my class-side method #materialize:.
"
Class {
	#name : #DBConnectionDescriptionSerializer,
	#superclass : #Object,
	#instVars : [
		'writeStream'
	],
	#category : 'DBConnectionsManager-Serializer'
}

{ #category : #materializing }
DBConnectionDescriptionSerializer class >> materializeFrom: aString [
	"Creates an instance of DBConnectionDescription from #aString and returns it."
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
DBConnectionDescriptionSerializer class >> on: aStream [
	^ self new
		writeStream: aStream;
		yourself
]

{ #category : #serializing }
DBConnectionDescriptionSerializer >> serialize: aDBConnectionDescription [
	"Convert the #aDBConnectionDescription into the format specified by the class implementing the serialization."
	self subclassResponsibility
]

{ #category : #accessing }
DBConnectionDescriptionSerializer >> writeStream [
	^ writeStream
]

{ #category : #accessing }
DBConnectionDescriptionSerializer >> writeStream: anObject [
	writeStream := anObject
]
