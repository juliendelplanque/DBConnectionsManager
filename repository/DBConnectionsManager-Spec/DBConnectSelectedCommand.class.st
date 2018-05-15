"
Connects the connection selected in the connections manager.
"
Class {
	#name : #DBConnectSelectedCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #DBConnectionsManager-Spec-Commands
}

{ #category : #accessing }
DBConnectSelectedCommand class >> commandName [
	^ 'Connect'
]

{ #category : #testing }
DBConnectSelectedCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
DBConnectSelectedCommand class >> weight [
	^ 100
]

{ #category : #execute }
DBConnectSelectedCommand >> execute [
	self connectionsManagerWidget selectedConnectionDescription connect
]
