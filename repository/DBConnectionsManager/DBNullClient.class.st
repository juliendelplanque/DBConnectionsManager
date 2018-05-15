"
I am the implementation of the null design pattern for DB client.

I implement:
- #dbcmConnect
- #dbcmConnect
- #dbcmExecute:

But do nothing.
"
Class {
	#name : #DBNullClient,
	#superclass : #Object,
	#category : 'DBConnectionsManager-Core'
}

{ #category : #'dbc interface' }
DBNullClient >> dbcmConnect [
	"Implement the interface used by DBConnectionsManager."
]

{ #category : #'dbc interface' }
DBNullClient >> dbcmDisconnect [
	"Implement the interface used by DBConnectionsManager."
]

{ #category : #'dbc interface' }
DBNullClient >> dbcmExecute: aString [
	"Implement the interface used by DBConnectionsManager."
]

{ #category : #'dbc interface' }
DBNullClient >> dbcmIsConnected [
	^ true
]
