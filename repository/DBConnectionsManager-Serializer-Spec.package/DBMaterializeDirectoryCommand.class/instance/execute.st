execute
execute
	| directoryReference connectionDescription |
	directoryReference := FDOpenDirectoryDialog new
					openModal.
	
	directoryReference ifNil: [ ^ self ]. "User cancelled selection." 
	
	(directoryReference childrenMatching: '*.json') do: [ :fileReference |
		[
			connectionDescription := DBConnectionDescriptionJSONSerializer materializeFrom: fileReference contents.
			self connectionsManager add: connectionDescription.
		] on: Error do: [ :error  | UIManager default inform: ('Could not load file {1}.' format: { fileReference fullName}) ] ]