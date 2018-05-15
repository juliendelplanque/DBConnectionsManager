Class {
	#name : #DBMaterializeConnectionCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #DBConnectionsManager-Serializer-Spec
}

{ #category : #accessing }
DBMaterializeConnectionCommand class >> commandName [
	^ 'Load from disk...'
]

{ #category : #testing }
DBMaterializeConnectionCommand class >> isForAllConnections [
	^ true
]

{ #category : #accessing }
DBMaterializeConnectionCommand class >> weight [
	^ 400
]

{ #category : #execute }
DBMaterializeConnectionCommand >> execute [
	| fileReference connectionDescription |
	fileReference := FDOpenFileDialog new
					extensionFilters: {
						'JSON file' -> #(json).
					};
					openModal.
	
	fileReference ifNil: [ ^ self ]. "User cancelled selection." 
	
	[
		connectionDescription := DBConnectionDescriptionJSONSerializer materializeFrom: fileReference contents.
		self connectionsManager add: connectionDescription.
	] on: Error do: [ :error  | UIManager default alert: error messageText title: 'Error while loading the file.' ]
]
