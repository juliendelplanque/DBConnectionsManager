Class {
	#name : #LtConnectAllCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtConnectAllCommand class >> defaultCommandName [
	^ 'Connect all'
]

{ #category : #execute }
LtConnectAllCommand >> execute [
	self connectionsManager connectAll
]
