Class {
	#name : #DBConnectSelectedCommand2,
	#superclass : #DBSingleConnectionWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBConnectSelectedCommand2 class >> defaultName [
	^ 'Connect'
]

{ #category : #execute }
DBConnectSelectedCommand2 >> execute [
	self selectedConnectionDescription connect
]
