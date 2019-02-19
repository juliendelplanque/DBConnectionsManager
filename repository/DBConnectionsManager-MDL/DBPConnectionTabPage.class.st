Class {
	#name : #DBPConnectionTabPage,
	#superclass : #DBPComponent,
	#instVars : [
		'connection'
	],
	#category : #'DBConnectionsManager-MDL'
}

{ #category : #'instance creation' }
DBPConnectionTabPage class >> connection: anObject [
	^ self new
		connection: anObject;
		yourself
]

{ #category : #accessing }
DBPConnectionTabPage class >> tabName [
	^ self subclassResponsibility
]

{ #category : #accessing }
DBPConnectionTabPage class >> weight [
	^ self subclassResponsibility
]

{ #category : #accessing }
DBPConnectionTabPage >> connection [
	^ connection
]

{ #category : #accessing }
DBPConnectionTabPage >> connection: anObject [
	connection := anObject
]
