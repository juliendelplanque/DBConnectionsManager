initialization
initializePresenter
	super initializePresenter.
	
	self newConnectionButton
		label: 'New connection';
		action: [
			DBConnectionDescriptionWidget new
				okButtonAction: [ :widget |
					connectionsManager add: widget asDBConnectionDescription.
					widget window close ];
				openWithSpec ].
	
	self connectionDescriptionsList
		whenSelectedItemChanged: [ :item |
			item
				ifNotNil: [
					self connectionDescriptionEditor
						enabled: true;
						fillFieldsFrom: item ]
				ifNil: [
					self connectionDescriptionEditor
						enabled: false;
						clearFields  ] ];
		buildMenuBlock: [ :builder |
			self connectionDescriptionsList selectedConnectionDescription ifNotNil: [ 
				builder
					add: 'Connect' target: self selector: #connectSelectedConnection;
					add: 'Disconnect' target: self selector: #disconnectSelectedConnection;
					add: 'Remove' target: self selector: #removeSelectedConnection ] ].
			
	self connectionDescriptionEditor
		enabled: false;
		okButtonAction: [ :editor |
			|connectionDescription|
			connectionDescription := self connectionDescriptionsList selectedConnectionDescription.
			[ connectionDescription disconnect ] on: Error do: [ "Ignore, we just want to be sure it is disconnected." ].
			editor adaptToMyself: connectionDescription ];
		cancelButtonAction: [ :editor |
			editor fillFieldsFrom: self connectionDescriptionsList selectedConnectionDescription ]