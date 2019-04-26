Class {
	#name : #LtDisconnectSelectedCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtDisconnectSelectedCommand class >> defaultCommandName [
	^ 'Disconnect'
]

{ #category : #execute }
LtDisconnectSelectedCommand >> execute [
	self connectionsManagerWidget selectedConnectionDescription disconnect
]
