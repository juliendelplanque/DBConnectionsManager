"
Disconnects the connection selected in the connections manager.
"
Class {
	#name : #DBDisconnectSelectedCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #DBConnectionsManager-Spec-Commands
}

{ #category : #accessing }
DBDisconnectSelectedCommand class >> commandName [
	^ 'Disconnect'
]

{ #category : #testing }
DBDisconnectSelectedCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
DBDisconnectSelectedCommand class >> weight [
	^ 200
]

{ #category : #execute }
DBDisconnectSelectedCommand >> execute [
	self connectionsManagerWidget selectedConnectionDescription disconnect
]
