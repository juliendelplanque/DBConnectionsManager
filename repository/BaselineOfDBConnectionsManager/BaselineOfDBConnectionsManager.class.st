Class {
	#name : #BaselineOfDBConnectionsManager,
	#superclass : #BaselineOf,
	#category : #BaselineOfDBConnectionsManager
}

{ #category : #baselines }
BaselineOfDBConnectionsManager >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		self
			definePackages: spec;
			defineDependencies: spec;
			defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfDBConnectionsManager >> defineDependencies: spec [
	spec
		baseline: 'Garage' with: [ 
			spec
				repository: 'github://pharo-rdbms/garage:master';
				loads: #('postgresV2') ];
		baseline: 'FileDialog' with: [ 
			spec repository: 'github://peteruhnak/file-dialog/repository' ];
		baseline: 'P3' with: [ 
			spec repository: 'github://svenvc/P3' ]
]

{ #category : #baselines }
BaselineOfDBConnectionsManager >> defineGroups: spec [
	spec
		group: 'driverless'
			with: #('DBConnectionsManager' 'DBConnectionsManager-Spec' 'DBConnectionsManager-Serializer' 'DBConnectionsManager-Serializer-Spec');
		group: 'garage' with: #('driverless' 'DBConnectionsManager-Garage');
		group: 'p3' with: #('driverless' 'DBConnectionsManager-P3');
		group: 'default' with: #('p3');
		group: 'pgmetadata' with: #('garage' 'DBConnectionsManager-PgMetadataCompatibility')
]

{ #category : #baselines }
BaselineOfDBConnectionsManager >> definePackages: spec [
	spec
		package: #DBConnectionsManager;
		package: #'DBConnectionsManager-Garage' with: [ spec requires: #('DBConnectionsManager' 'Garage') ];
		package: #'DBConnectionsManager-P3' with: [ spec requires: #('DBConnectionsManager' 'P3') ];
		package: #'DBConnectionsManager-Spec' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Serializer' with: [ spec requires: #('DBConnectionsManager') ];
		package: #'DBConnectionsManager-Serializer-Spec'
			with: [ spec requires: #('DBConnectionsManager-Serializer' 'DBConnectionsManager-Spec' 'FileDialog') ];
		package: #'DBConnectionsManager-PgMetadataCompatibility' with: [ spec requires: #('DBConnectionsManager') ]
]
