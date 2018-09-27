"
Open an inspector of the connection selected in the connections manager.
"
Class {
	#name : #DBInspectSelectedCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Spec-Commands'
}

{ #category : #accessing }
DBInspectSelectedCommand class >> commandName [
	^ 'Inspect'
]

{ #category : #testing }
DBInspectSelectedCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
DBInspectSelectedCommand class >> weight [
	^ 1000
]

{ #category : #execute }
DBInspectSelectedCommand >> execute [
	self connectionsManagerWidget selectedConnectionDescription inspect
]
