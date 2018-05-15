"
I sort the connection list alphabetically showing dead connections first.
"
Class {
	#name : #DBSortDeadFirstCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #DBConnectionsManager-Spec-Commands
}

{ #category : #accessing }
DBSortDeadFirstCommand class >> commandName [
	^ 'Sort dead connections first'
]

{ #category : #testing }
DBSortDeadFirstCommand class >> isForAllConnections [
	^ false "Not ready yet"
]

{ #category : #accessing }
DBSortDeadFirstCommand class >> weight [
	^ 520
]

{ #category : #execute }
DBSortDeadFirstCommand >> execute [
	self connectionsManagerWidget connectionDescriptionsList
		sortingBlock: [ :a :b |
			(a isDead and: [ a name < b name ])
				or: [ a isDead not and: [ b isDead not and: [ a name < b name ] ] ] ]
]
