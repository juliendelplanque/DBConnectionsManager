Class {
	#name : #DBConnectAllCommand2,
	#superclass : #DBConnectionsManagerWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBConnectAllCommand2 class >> defaultName [
	^ 'Connect all'
]

{ #category : #execute }
DBConnectAllCommand2 >> execute [
	self connectionsManager connectAll
]
