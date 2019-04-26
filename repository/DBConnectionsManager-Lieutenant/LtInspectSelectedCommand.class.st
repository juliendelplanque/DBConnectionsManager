Class {
	#name : #LtInspectSelectedCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtInspectSelectedCommand class >> defaultCommandName [
	^ 'Inspect'
]

{ #category : #execute }
LtInspectSelectedCommand >> execute [
	self context inspect
]
