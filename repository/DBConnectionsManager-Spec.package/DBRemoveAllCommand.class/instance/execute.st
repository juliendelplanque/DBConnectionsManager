execute
execute
	(UIManager default confirm: 'Do you really want to remove all connections?' label: 'Please confirm this action')
		ifFalse: [ ^ self ].
	self connectionsManager
		disconnectAll;
		removeAll