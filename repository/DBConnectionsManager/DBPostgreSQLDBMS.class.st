"
I model PostgreSQL DBMS.
"
Class {
	#name : #DBPostgreSQLDBMS,
	#superclass : #DBDataBaseManagementSystem,
	#category : #'DBConnectionsManager-Core'
}

{ #category : #accessing }
DBPostgreSQLDBMS class >> dbmsName [
	^ 'PostgreSQL'
]

{ #category : #accessing }
DBPostgreSQLDBMS >> defaultConnectionPort [
	^ 5432
]

{ #category : #testing }
DBPostgreSQLDBMS >> isPostgreSQLDatabase [
	^ true
]
