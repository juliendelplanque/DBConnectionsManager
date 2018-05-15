"
I sort the connection list alphabetically.
"
Class {
	#name : #DBSortAlphabeticallyCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #DBConnectionsManager-Spec-Commands
}

{ #category : #accessing }
DBSortAlphabeticallyCommand class >> commandName [
	^ 'Sort alphabetically'
]

{ #category : #testing }
DBSortAlphabeticallyCommand class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
DBSortAlphabeticallyCommand class >> weight [
	^ 500
]

{ #category : #execute }
DBSortAlphabeticallyCommand >> execute [
	self connectionsManagerWidget connectionDescriptionsList
		sortAlphabetically
]
