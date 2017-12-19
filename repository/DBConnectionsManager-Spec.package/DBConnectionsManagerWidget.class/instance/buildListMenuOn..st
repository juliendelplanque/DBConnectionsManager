list menu
buildListMenuOn: builder
	self connectionDescriptionsList selectedConnectionDescription
		ifNotNil: [ 
			DBConnectionsManagerWidgetCommand subclassesForSingleConnection reject: #isExtensionCommand 
				thenDo: [ :commandClass |
				builder
					add: commandClass commandName
					target: [ 
						commandClass new
							connectionsManagerWidget: self;
							execute ]
					selector: #value ].
			DBConnectionsManagerWidgetCommand subclassesForSingleConnection select: #isExtensionCommand 
				thenDo: [ :commandClass |
				builder
					add: commandClass commandName
					target: [ 
						commandClass new
							connectionsManagerWidget: self;
							execute ]
					selector: #value ] ].
	builder addLine.
	DBConnectionsManagerWidgetCommand subclassesForAllConnections reject: #isExtensionCommand 
		thenDo: [ :commandClass |
		builder
			add: commandClass commandName
			target: [ 
				commandClass new
					connectionsManagerWidget: self;
					execute ]
			selector: #value ].
	
	DBConnectionsManagerWidgetCommand subclassesForAllConnections select: #isExtensionCommand 
		thenDo: [ :commandClass |
		builder
			add: commandClass commandName
			target: [ 
				commandClass new
					connectionsManagerWidget: self;
					execute ]
			selector: #value ]