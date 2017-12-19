list menu
buildListMenuOn: builder
	self connectionDescriptionsList selectedConnectionDescription
		ifNotNil: [ 
			DBConnectionsManagerWidgetCommand subclassesForSingleConnection do: [ :commandClass |
				builder
					add: commandClass commandName
					target: [ 
						commandClass new
							connectionsManagerWidget: self;
							execute ]
					selector: #value ] ].
	builder addLine.
	DBConnectionsManagerWidgetCommand subclassesForAllConnections do: [ :commandClass |
		builder
			add: commandClass commandName
			target: [ 
				commandClass new
					connectionsManagerWidget: self;
					execute ]
			selector: #value ]