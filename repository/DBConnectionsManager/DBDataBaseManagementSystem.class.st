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

{ #category : #private }
DBDataBaseManagementSystem class >> availableDriverSetters [
	^ (Pragma allNamed: #dbcmDriverSetter in: DBDataBaseManagementSystem class)
			collect: #methodSelector
]

{ #category : #accessing }
DBDataBaseManagementSystem class >> connectionBuildingSymbol [
	^ ConnectionBuildingSymbol ifNil: [ 
		self useAnyAvailableDriverElseUseNullDriver.
		ConnectionBuildingSymbol ]
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

{ #category : #'driver setting' }
DBDataBaseManagementSystem class >> useAnyAvailableDriverElseUseNullDriver [
	"If there is any method in this class that has the pragma <dbcmDriverSetter>, call it to set the #ConnectionBuildingSymbol class variable.
	Else, call useNullDriver.
	"
	self availableDriverSetters
		ifEmpty: [ self useNullDriver ]
		ifNotEmpty: [ :selectors | selectors anyOne value: self ]
]

{ #category : #'null driver' }
DBDataBaseManagementSystem class >> useNullDriver [
	ConnectionBuildingSymbol := #buildNullConnectionFrom:
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
