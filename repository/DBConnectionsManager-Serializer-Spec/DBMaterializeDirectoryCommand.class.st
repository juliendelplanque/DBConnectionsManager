Class {
	#name : #DBMaterializeDirectoryCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Serializer-Spec'
}

{ #category : #accessing }
DBMaterializeDirectoryCommand class >> commandName [
	^ 'Load all connections from directory...'
]

{ #category : #testing }
DBMaterializeDirectoryCommand class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
DBMaterializeDirectoryCommand class >> menuCategory [
	^ #serializing
]

{ #category : #accessing }
DBMaterializeDirectoryCommand class >> weight [
	^ 401
]

{ #category : #execute }
DBMaterializeDirectoryCommand >> execute [
	| directoryReference connectionDescription |
	directoryReference := FDOpenDirectoryDialog new
					openModal.
	
	directoryReference ifNil: [ ^ self ]. "User cancelled selection." 
	
	(directoryReference childrenMatching: '*.json') do: [ :fileReference |
		[
			connectionDescription := DBConnectionDescriptionJSONSerializer materializeFrom: fileReference contents.
			self connectionsManager add: connectionDescription.
		] on: Error do: [ :error  | UIManager default inform: ('Could not load file {1}.' format: { fileReference fullName}) ] ]
]
