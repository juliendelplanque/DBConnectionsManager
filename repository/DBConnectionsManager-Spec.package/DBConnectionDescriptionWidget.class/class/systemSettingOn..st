settings
systemSettingOn: aBuilder
	<systemsettings>
	
	(aBuilder setting: #defaultHostname)
		parent: #DBConnectionsManager;
		target: self;
		label: 'Default hostname';
		description: 'Default value for the hostname field in a connection decription.';
		type: #String.
	(aBuilder setting: #defaultPort)
		parent: #DBConnectionsManager;
		target: self;
		label: 'Default port number';
		description: 'Default value for the port number field in a connection description.';
		type: #Integer.