"
Removes all the connections of the connections manager.
"
Class {
	#name : #DBRemoveAllCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Spec-Commands'
}

{ #category : #accessing }
DBRemoveAllCommand class >> commandName [
	^ 'Remove all'
]

{ #category : #testing }
DBRemoveAllCommand class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
DBRemoveAllCommand class >> menuCategory [
	^ #management
]

{ #category : #accessing }
DBRemoveAllCommand class >> weight [
	^ 300
]

{ #category : #execute }
DBRemoveAllCommand >> execute [
	(UIManager default confirm: 'Do you really want to remove all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager
		disconnectAll;
		removeAll
]
