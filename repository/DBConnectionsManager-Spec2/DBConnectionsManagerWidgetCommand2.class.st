Class {
	#name : #DBConnectionsManagerWidgetCommand2,
	#superclass : #CmCommand,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBConnectionsManagerWidgetCommand2 >> connectionsManager [
	^ self connectionsManagerWidget connectionsManager
]

{ #category : #accessing }
DBConnectionsManagerWidgetCommand2 >> connectionsManagerWidget [
	^ self context
]

{ #category : #execute }
DBConnectionsManagerWidgetCommand2 >> execute [
	"Execute the command."
	self subclassResponsibility
]
