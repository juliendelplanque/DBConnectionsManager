Class {
	#name : #LtDisconnectAllCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtDisconnectAllCommand class >> defaultCommandName [
	^ 'Disconnect all'
]

{ #category : #execute }
LtDisconnectAllCommand >> execute [
	(UIManager default confirm: 'Do you really want to disconnect all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager disconnectAll
]
