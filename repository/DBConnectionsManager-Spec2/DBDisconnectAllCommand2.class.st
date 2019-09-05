Class {
	#name : #DBDisconnectAllCommand2,
	#superclass : #DBConnectionsManagerWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBDisconnectAllCommand2 class >> defaultName [
	^ 'Disconnect all'
]

{ #category : #execute }
DBDisconnectAllCommand2 >> execute [
	(UIManager default confirm: 'Do you really want to disconnect all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager disconnectAll
]
