Extension { #name : #DBConnectionDescription }

{ #category : #'*DBConnectionsManager-MDL' }
DBConnectionDescription >> asDBConnectionPage [
	^ DBPConnectionMainPage connection: self
]
