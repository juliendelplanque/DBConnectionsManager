list menu
buildListMenuOn: builder
	self connectionDescriptionsList selectedConnectionDescription
		ifNotNil: [ builder
				add: 'Connect' target: self selector: #connectSelectedConnection;
				add: 'Disconnect' target: self selector: #disconnectSelectedConnection;
				add: 'Remove' target: self selector: #removeSelectedConnection ].
	builder
		addLine;
		add: 'Connect all' target: self selector: #connectAllConnections;
		add: 'Disconnect all' target: self selector: #disconnectAllConnections;
		add: 'Remove all' target: self selector: #removeAllConnections