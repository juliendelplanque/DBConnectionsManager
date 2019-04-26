Class {
	#name : #LtConnectionsManagerWidgetCommand,
	#superclass : #LtCommand,
	#instVars : [
		'connectionsManagerWidget'
	],
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtConnectionsManagerWidgetCommand >> connectionsManager [
	^ self connectionsManagerWidget connectionsManager
]

{ #category : #accessing }
LtConnectionsManagerWidgetCommand >> connectionsManagerWidget [
	^ connectionsManagerWidget
]

{ #category : #accessing }
LtConnectionsManagerWidgetCommand >> connectionsManagerWidget: anObject [
	connectionsManagerWidget := anObject
]

{ #category : #hooks }
LtConnectionsManagerWidgetCommand >> extractInformationFromContext: aDBConnectionsManagerWidget [
	self connectionsManagerWidget: aDBConnectionsManagerWidget
]
