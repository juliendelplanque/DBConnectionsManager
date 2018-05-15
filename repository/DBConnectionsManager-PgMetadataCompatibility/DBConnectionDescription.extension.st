Extension { #name : #DBConnectionDescription }

{ #category : #'*DBConnectionsManager-PgMetadataCompatibility' }
DBConnectionDescription >> getConnectionString [
	^ self connectionUrl
]
