Class {
	#name : #DBInspectSelectedCommand2,
	#superclass : #DBSingleConnectionWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBInspectSelectedCommand2 class >> defaultName [
	^ 'Inspect'
]

{ #category : #execute }
DBInspectSelectedCommand2 >> execute [
	self selectedConnectionDescription inspect
]
