"
I am an abstract command for the DBConnectionManagerWidget.
"
Class {
	#name : #DBConnectionsManagerWidgetCommand,
	#superclass : #Object,
	#instVars : [
		'connectionsManagerWidget'
	],
	#category : #DBConnectionsManager-Spec-Commands
}

{ #category : #accessing }
DBConnectionsManagerWidgetCommand class >> commandName [
	"The name of the command to show in the UI."
	^ self subclassResponsibility
]

{ #category : #testing }
DBConnectionsManagerWidgetCommand class >> isForAllConnections [
	^ false
]

{ #category : #testing }
DBConnectionsManagerWidgetCommand class >> isForSingleConnection [
	^ false
]

{ #category : #'subclasses access' }
DBConnectionsManagerWidgetCommand class >> subclassesForAllConnections [
	^ (DBConnectionsManagerWidgetCommand subclasses select: #isForAllConnections) sorted: [ :a :b | a weight < b weight ]
]

{ #category : #'subclasses access' }
DBConnectionsManagerWidgetCommand class >> subclassesForSingleConnection [
	^ (DBConnectionsManagerWidgetCommand subclasses select: #isForSingleConnection) sorted: [ :a :b | a weight < b weight ]
]

{ #category : #accessing }
DBConnectionsManagerWidgetCommand class >> weight [
	"Returns the weight of the command (for displaying it in the menu).
	 The less weight, the higher in the menu.
	 Of course, this method should return a Number.
	"
	^ self subclassResponsibility
]

{ #category : #accessing }
DBConnectionsManagerWidgetCommand >> connectionsManager [
	^ self connectionsManagerWidget connectionsManager
]

{ #category : #accessing }
DBConnectionsManagerWidgetCommand >> connectionsManagerWidget [
	^ connectionsManagerWidget
]

{ #category : #accessing }
DBConnectionsManagerWidgetCommand >> connectionsManagerWidget: anObject [
	connectionsManagerWidget := anObject
]

{ #category : #execute }
DBConnectionsManagerWidgetCommand >> execute [
	"Execute the command."
	self subclassResponsibility
]
