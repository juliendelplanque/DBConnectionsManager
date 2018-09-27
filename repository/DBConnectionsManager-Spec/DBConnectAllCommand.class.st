"
Connects all the connections of the connections manager.
"
Class {
	#name : #DBConnectAllCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Spec-Commands'
}

{ #category : #accessing }
DBConnectAllCommand class >> commandName [
	^ 'Connect all'
]

{ #category : #testing }
DBConnectAllCommand class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
DBConnectAllCommand class >> menuCategory [
	^ #connecting
]

{ #category : #accessing }
DBConnectAllCommand class >> weight [
	^ 100
]

{ #category : #execute }
DBConnectAllCommand >> execute [
	self connectionsManager connectAll
]
