Class {
	#name : #DBPConnectionMainPage,
	#superclass : #DBPComponent,
	#instVars : [
		'connection'
	],
	#category : #'DBConnectionsManager-MDL'
}

{ #category : #'instance creation' }
DBPConnectionMainPage class >> connection: anObject [
	^ self new
		connection: anObject;
		yourself
]

{ #category : #accessing }
DBPConnectionMainPage >> connection [
	^ connection
]

{ #category : #accessing }
DBPConnectionMainPage >> connection: anObject [
	connection := anObject
]

{ #category : #accessing }
DBPConnectionMainPage >> pageName [
	^ self connection name
]

{ #category : #accessing }
DBPConnectionMainPage >> pathName [
	^ self pageName copyWithout: Character space
]

{ #category : #rendering }
DBPConnectionMainPage >> renderOn: html [
	| tabWidget |
	tabWidget := MDLTabWidget new.
	self tabs do: [ :tab |
		tabWidget addTabNamed: tab tabName content: (tab connection: self connection) ].
	html mdlGrid
		with: [ 
			html mdlCell
				size: 12;
				with: [ html heading
							level4;
							with: self connection name ].
			html mdlCell
				size: 12;
				with: [ 	html
		render: tabWidget ] ].
]

{ #category : #accessing }
DBPConnectionMainPage >> tabs [
	^ DBPConnectionTabPage subclasses
]
