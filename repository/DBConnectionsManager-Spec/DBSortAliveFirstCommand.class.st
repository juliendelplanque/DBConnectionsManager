"
I sort the connection list alphabetically showing alive connections first.
"
Class {
	#name : #DBSortAliveFirstCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #DBConnectionsManager-Spec-Commands
}

{ #category : #accessing }
DBSortAliveFirstCommand class >> commandName [
	^ 'Sort alive connections first'
]

{ #category : #testing }
DBSortAliveFirstCommand class >> isForAllConnections [
	^ false "Not ready yet"
]

{ #category : #accessing }
DBSortAliveFirstCommand class >> weight [
	^ 510
]

{ #category : #execute }
DBSortAliveFirstCommand >> execute [
	self connectionsManagerWidget connectionDescriptionsList
		sortingBlock: [ :a :b |
			(a isAlive and: [ a name < b name ])
				or: [ a isAlive not and: [ b isAlive not and: [ a name < b name ] ] ] ]
]
