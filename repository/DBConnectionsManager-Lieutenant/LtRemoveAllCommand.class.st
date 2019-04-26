Class {
	#name : #LtRemoveAllCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtRemoveAllCommand class >> defaultCommandName [
	^ 'Remove all'
]

{ #category : #execute }
LtRemoveAllCommand >> execute [
	(UIManager default confirm: 'Do you really want to remove all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager
		disconnectAll;
		removeAll
]
