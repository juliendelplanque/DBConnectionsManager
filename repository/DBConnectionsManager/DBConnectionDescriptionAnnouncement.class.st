"
I am an abstract announcement related to the DBConnectionsManager about an event concerning one of the connectionDescription.
"
Class {
	#name : #DBConnectionDescriptionAnnouncement,
	#superclass : #DBConnectionsManagerAnnouncement,
	#instVars : [
		'connectionDescription'
	],
	#category : #DBConnectionsManager-Announcements
}

{ #category : #accessing }
DBConnectionDescriptionAnnouncement class >> connectionDescription: aDBConnectionDescription [
	^ self new
		connectionDescription: aDBConnectionDescription;
		yourself
]

{ #category : #accessing }
DBConnectionDescriptionAnnouncement >> connectionDescription [
	^ connectionDescription
]

{ #category : #accessing }
DBConnectionDescriptionAnnouncement >> connectionDescription: anObject [
	connectionDescription := anObject
]
