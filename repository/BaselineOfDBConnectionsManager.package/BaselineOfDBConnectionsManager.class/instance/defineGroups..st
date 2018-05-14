baselines
defineGroups: spec
	spec
		group: 'driverless' with: #('DBConnectionsManager' 'DBConnectionsManager-Spec' 'DBConnectionsManager-Serializer' 'DBConnectionsManager-Serializer-Spec');
		group: 'garage' with: #('driverless' 'DBConnectionsManager-Garage');
		group: 'p3' with: #('driverless' 'DBConnectionsManager-P3');
		group: 'default' with: #('p3')