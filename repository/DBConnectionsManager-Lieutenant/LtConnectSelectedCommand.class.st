Class {
	#name : #LtConnectSelectedCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtConnectSelectedCommand class >> defaultCommandName [
	^ 'Connect'
]

{ #category : #execute }
LtConnectSelectedCommand >> execute [
	self connectionsManagerWidget selectedConnectionDescription connect
]
