Class {
	#name : #DBRemoveAllCommand2,
	#superclass : #DBConnectionsManagerWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBRemoveAllCommand2 class >> defaultName [
	^ 'Remove all'
]

{ #category : #execute }
DBRemoveAllCommand2 >> execute [
	(UIManager default confirm: 'Do you really want to remove all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager
		disconnectAll;
		removeAll
]
