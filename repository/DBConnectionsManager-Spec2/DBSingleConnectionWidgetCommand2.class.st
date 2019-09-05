Class {
	#name : #DBSingleConnectionWidgetCommand2,
	#superclass : #DBConnectionsManagerWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #testing }
DBSingleConnectionWidgetCommand2 >> canBeExecuted [
	^ self selectedConnectionDescription isNotNil
]

{ #category : #api }
DBSingleConnectionWidgetCommand2 >> selectedConnectionDescription [
	^ self connectionsManagerWidget selectedConnectionDescription
]
