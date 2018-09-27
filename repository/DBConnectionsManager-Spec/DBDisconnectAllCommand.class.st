"
Disconnects all the connections of the connections manager.
"
Class {
	#name : #DBDisconnectAllCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Spec-Commands'
}

{ #category : #accessing }
DBDisconnectAllCommand class >> commandName [
	^ 'Disconnect all'
]

{ #category : #testing }
DBDisconnectAllCommand class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
DBDisconnectAllCommand class >> menuCategory [
	^ #connecting
]

{ #category : #accessing }
DBDisconnectAllCommand class >> weight [
	^ 200
]

{ #category : #execute }
DBDisconnectAllCommand >> execute [
	(UIManager default confirm: 'Do you really want to disconnect all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager disconnectAll
]
