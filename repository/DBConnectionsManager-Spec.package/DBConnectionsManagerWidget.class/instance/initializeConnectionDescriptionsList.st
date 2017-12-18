initialization
initializeConnectionDescriptionsList
	self connectionDescriptionsList
		whenSelectedItemChanged: [ :item | 
			item
				ifNotNil: [ self connectionDescriptionEditor
						enabled: true;
						fillFieldsFrom: item ]
				ifNil: [ self connectionDescriptionEditor
						enabled: false;
						clearFields ] ];
		buildMenuBlock: [ :builder | 
			self connectionDescriptionsList selectedConnectionDescription
				ifNotNil: [ builder
						add: 'Connect'
							target: self
							selector: #connectSelectedConnection;
						add: 'Disconnect'
							target: self
							selector: #disconnectSelectedConnection;
						add: 'Remove' target: self selector: #removeSelectedConnection ].
			builder
				add: 'Remove all'
				target: self
				selector: #removeAllConnections ]