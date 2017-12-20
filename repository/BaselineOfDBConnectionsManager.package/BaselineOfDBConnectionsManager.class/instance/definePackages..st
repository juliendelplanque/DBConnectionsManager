baselines
definePackages: spec
	spec 
		package: #'DBConnectionsManager' with: [ spec requires: #('Garage-PostgreSQL') ];
		package: #'DBConnectionsManager-PgMetadata' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Spec' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Serializer' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Serializer-Spec' with: [ spec requires: #('DBConnectionsManager-Serializer' 'DBConnectionsManager-Spec' 'FileDialog') ]