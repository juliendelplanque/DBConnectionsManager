Class {
	#name : #LtRemoveSelectedCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtRemoveSelectedCommand class >> defaultCommandName [
	^ 'Remove'
]

{ #category : #execute }
LtRemoveSelectedCommand >> execute [
	| toRemove |
	toRemove := self connectionsManagerWidget selectedConnectionDescription.
	self connectionsManagerWidget connectionDescriptionsList unselectConnectionDescription.
	toRemove disconnect.
	self connectionsManager remove: toRemove
]
