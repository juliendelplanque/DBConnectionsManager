Class {
	#name : #LtSerializeConnectionCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtSerializeConnectionCommand class >> defaultCommandName [
	^ 'Save on disk...'
]

{ #category : #accessing }
LtSerializeConnectionCommand class >> weight [
	^ 400
]

{ #category : #execute }
LtSerializeConnectionCommand >> execute [
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
