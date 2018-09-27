Class {
	#name : #DBSerializeConnectionCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Serializer-Spec'
}

{ #category : #accessing }
DBSerializeConnectionCommand class >> commandName [
	^ 'Save on disk...'
]

{ #category : #testing }
DBSerializeConnectionCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
DBSerializeConnectionCommand class >> menuCategory [
	^ #serializing
]

{ #category : #accessing }
DBSerializeConnectionCommand class >> weight [
	^ 400
]

{ #category : #execute }
DBSerializeConnectionCommand >> execute [
	| serializer fileReference dialog |
	dialog := FDSaveFileDialog new
					extensionFilters: {
						'JSON file' -> #(json).
					};
					selectFile: FileLocator home / (self connectionsManagerWidget selectedConnectionDescription name , '.json')
					yourself.
	fileReference := dialog openModal.
	fileReference ifNil: [ ^ self ]. "User cancelled."
	[ fileReference extension = 'json' ] whileFalse: [ 
		UIManager default alert: 'Please create a file with ".json" extension.'.
		fileReference := dialog openModal.
		fileReference ifNil: [ ^ self ] "User cancelled."
	].

	
	fileReference writeStreamDo: [ :stream |
		serializer := DBConnectionDescriptionJSONSerializer on: stream.
		serializer serialize: self connectionsManagerWidget selectedConnectionDescription.
	]
]
