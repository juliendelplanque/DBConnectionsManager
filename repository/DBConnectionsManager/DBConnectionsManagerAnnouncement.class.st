"
I am an abstract announcement related to the DBConnectionsManager.
"
Class {
	#name : #DBConnectionsManagerAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'connectionsManager'
	],
	#category : #DBConnectionsManager-Announcements
}

{ #category : #accessing }
DBConnectionsManagerAnnouncement >> connectionsManager [
	^ connectionsManager
]

{ #category : #accessing }
DBConnectionsManagerAnnouncement >> connectionsManager: anObject [
	connectionsManager := anObject
]
