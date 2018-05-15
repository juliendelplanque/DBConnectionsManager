Extension { #name : #GADriver }

{ #category : #'*DBConnectionsManager-Garage' }
GADriver >> dbcmConnect [
	"Implement the interface used by DBConnectionsManager."
	^ self connect
]

{ #category : #'*DBConnectionsManager-Garage' }
GADriver >> dbcmDisconnect [
	"Implement the interface used by DBConnectionsManager."
	^ self close
]

{ #category : #'*DBConnectionsManager-Garage' }
GADriver >> dbcmExecute: aString [
	"Implement the interface used by DBConnectionsManager."
	^ self execute: aString
]

{ #category : #'*DBConnectionsManager-Garage' }
GADriver >> dbcmIsConnected [
	^ self isConnected
]
