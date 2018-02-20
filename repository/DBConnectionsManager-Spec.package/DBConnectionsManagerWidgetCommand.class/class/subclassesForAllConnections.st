subclasses access
subclassesForAllConnections
	^ (DBConnectionsManagerWidgetCommand subclasses select: #isForAllConnections) sorted: [ :a :b | a weight < b weight ]