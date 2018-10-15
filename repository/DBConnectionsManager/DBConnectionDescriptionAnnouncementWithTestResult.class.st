"
Same as my superclass but holding the result of a connection test as well..
"
Class {
	#name : #DBConnectionDescriptionAnnouncementWithTestResult,
	#superclass : #DBConnectionDescriptionAnnouncement,
	#instVars : [
		'testResult'
	],
	#category : #'DBConnectionsManager-Announcements'
}

{ #category : #accessing }
DBConnectionDescriptionAnnouncementWithTestResult >> testResult [
	^ testResult
]

{ #category : #accessing }
DBConnectionDescriptionAnnouncementWithTestResult >> testResult: anObject [
	testResult := anObject
]
