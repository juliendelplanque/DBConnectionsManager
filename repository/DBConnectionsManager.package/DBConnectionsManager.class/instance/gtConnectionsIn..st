gt-inspector-extension
gtConnectionsIn: composite
	<gtInspectorPresentationOrder: 0> 
	^ (composite fastTable)
		title: 'Connections';
		display: [ 
			self connections asOrderedCollection ];
		column: 'Name' evaluated: #name;
		column: 'Hostname' evaluated: #hostname width: 100;
		column: 'Port' evaluated: #port width: 50;
		column: 'Database' evaluated: #databaseName width: 150;
		column: 'User' evaluated: #userName;
		beMultiple;
		send: [ :result | result isNil 
			ifTrue:[nil]
			ifFalse:[ (result size = 1) 
				ifTrue: [result anyOne] 
				ifFalse: [self species withAll: result]]]