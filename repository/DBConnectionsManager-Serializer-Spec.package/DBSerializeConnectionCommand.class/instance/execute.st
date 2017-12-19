execute
execute
	| serializer fileReference dialog |
	dialog := FDSaveFileDialog new
					extensionFilters: {
						'JSON file' -> #(json).
					};
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