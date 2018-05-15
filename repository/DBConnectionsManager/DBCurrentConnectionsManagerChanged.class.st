"
I am the announcement created by the DBConnectionsManager when the #current class-side instance variable of DBConnectionsManager is modified.
"
Class {
	#name : #DBCurrentConnectionsManagerChanged,
	#superclass : #DBConnectionsManagerAnnouncement,
	#instVars : [
		'oldConnectionManager'
	],
	#category : #DBConnectionsManager-Announcements
}

{ #category : #accessing }
DBCurrentConnectionsManagerChanged >> oldConnectionManager [
	^ oldConnectionManager
]

{ #category : #accessing }
DBCurrentConnectionsManagerChanged >> oldConnectionManager: anObject [
	oldConnectionManager := anObject
]
