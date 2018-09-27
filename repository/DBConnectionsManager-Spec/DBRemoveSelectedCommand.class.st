"
Removes the connection selected in the connections manager.
"
Class {
	#name : #DBRemoveSelectedCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Spec-Commands'
}

{ #category : #accessing }
DBRemoveSelectedCommand class >> commandName [
	^ 'Remove'
]

{ #category : #testing }
DBRemoveSelectedCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
DBRemoveSelectedCommand class >> menuCategory [
	^ #management
]

{ #category : #accessing }
DBRemoveSelectedCommand class >> weight [
	^ 300
]

{ #category : #execute }
DBRemoveSelectedCommand >> execute [
	| toRemove |
	toRemove := self connectionsManagerWidget selectedConnectionDescription.
	self connectionsManagerWidget connectionDescriptionsList unselectConnectionDescription.
	toRemove disconnect.
	self connectionsManager remove: toRemove
]
