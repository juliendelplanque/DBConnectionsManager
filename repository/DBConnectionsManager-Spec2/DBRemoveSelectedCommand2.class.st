Class {
	#name : #DBRemoveSelectedCommand2,
	#superclass : #DBSingleConnectionWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBRemoveSelectedCommand2 class >> defaultName [
	^ 'Remove'
]

{ #category : #execute }
DBRemoveSelectedCommand2 >> execute [
	| toRemove |
	toRemove := self selectedConnectionDescription.
	self connectionsManagerWidget connectionDescriptionsList unselectConnectionDescription.
	toRemove disconnect.
	self connectionsManager remove: toRemove
]
