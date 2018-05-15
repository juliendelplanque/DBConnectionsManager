"
I model a DataBase Management System (DBMS) that this framework is able to handle.
"
Class {
	#name : #DBDataBaseManagementSystem,
	#superclass : #Object,
	#classVars : [
		'ConnectionBuildingSymbol'
	],
	#category : #DBConnectionsManager-Core
}

{ #category : #accessing }
DBDataBaseManagementSystem class >> connectionBuildingSymbol [
	^ ConnectionBuildingSymbol ifNil: [ 
		self useNullDriver.
		ConnectionBuildingSymbol ]
]

{ #category : #accessing }
DBDataBaseManagementSystem class >> connectionBuildingSymbol: aBlockOrSymbol [
	ConnectionBuildingSymbol := aBlockOrSymbol
]

{ #category : #accessing }
DBDataBaseManagementSystem class >> dbmsName [
	"Returns a String that allows to uniquely identify a DBDatabaseManagementSystem' subclass."
	^ self subclassResponsibility
]

{ #category : #accessing }
DBDataBaseManagementSystem class >> dbmsNamed: aString [
	^ (DBDataBaseManagementSystem subclasses detect: [ :c | c dbmsName = aString ]) new
]

{ #category : #'null driver' }
DBDataBaseManagementSystem class >> useNullDriver [
	self connectionBuildingSymbol: #buildNullConnectionFrom:
]

{ #category : #'connection building' }
DBDataBaseManagementSystem >> buildConnectionFrom: aDBConnectionDescription [
	^ self perform: self class connectionBuildingSymbol with: aDBConnectionDescription
]

{ #category : #'connection building' }
DBDataBaseManagementSystem >> buildNullConnectionFrom: aDBConnectionDescription [
	^ DBNullClient new
]

{ #category : #accessing }
DBDataBaseManagementSystem >> defaultConnectionPort [
	^ self subclassResponsibility
]

{ #category : #testing }
DBDataBaseManagementSystem >> isPostgreSQLDatabase [
	^ false
]

{ #category : #accessing }
DBDataBaseManagementSystem >> name [
	^ self class dbmsName
]
