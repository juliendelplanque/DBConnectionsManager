Extension { #name : #P3Client }

{ #category : #'*DBConnectionsManager-P3' }
P3Client >> dbcmConnect [
	"Implement the interface used by DBConnectionsManager."
	^ self connect
]

{ #category : #'*DBConnectionsManager-P3' }
P3Client >> dbcmDisconnect [
	"Implement the interface used by DBConnectionsManager."
	^ self close
]

{ #category : #'*DBConnectionsManager-P3' }
P3Client >> dbcmExecute: aString [
	"Implement the interface used by DBConnectionsManager."
	^ self query: aString
]

{ #category : #'*DBConnectionsManager-P3' }
P3Client >> dbcmIsConnected [
	^ self isConnected
]
