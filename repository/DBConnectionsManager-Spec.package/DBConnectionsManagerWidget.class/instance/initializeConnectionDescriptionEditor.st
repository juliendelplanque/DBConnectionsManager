initialization
initializeConnectionDescriptionEditor
	self connectionDescriptionEditor
		enabled: false;
		okButtonAction: [ :editor | 
			| connectionDescription |
			connectionDescription := self connectionDescriptionsList
				selectedConnectionDescription.
			[ connectionDescription disconnect ]
				on: Error
				do: [ "Ignore, we just want to be sure it is disconnected." ].
			editor adaptToMyself: connectionDescription ];
		cancelButtonAction: [ :editor | 
			editor
				fillFieldsFrom: self connectionDescriptionsList selectedConnectionDescription ]