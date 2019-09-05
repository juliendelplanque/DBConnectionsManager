Class {
	#name : #DBDisconnectSelectedCommand2,
	#superclass : #DBSingleConnectionWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBDisconnectSelectedCommand2 class >> defaultName [
	^ 'Disconnect'
]

{ #category : #execute }
DBDisconnectSelectedCommand2 >> execute [
	self selectedConnectionDescription disconnect
]
