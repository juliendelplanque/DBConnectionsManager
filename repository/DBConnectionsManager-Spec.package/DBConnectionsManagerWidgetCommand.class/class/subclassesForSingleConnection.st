subclasses access
subclassesForSingleConnection
	^ (DBConnectionsManagerWidgetCommand subclasses select: #isForSingleConnection) sorted: [ :a :b | a weight < b weight ]