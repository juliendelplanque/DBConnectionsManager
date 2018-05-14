baselines
definePackages: spec
	spec 
		package: #'DBConnectionsManager';
		package: #'DBConnectionsManager-Garage' with: [ spec requires: #('DBConnectionsManager' 'Garage-PostgreSQL') ];
		package: #'DBConnectionsManager-P3' with: [ spec requires: #('DBConnectionsManager' 'P3') ];
		package: #'DBConnectionsManager-Spec' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Serializer' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Serializer-Spec' with: [ spec requires: #('DBConnectionsManager-Serializer' 'DBConnectionsManager-Spec' 'FileDialog') ]