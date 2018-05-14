baselines
defineDependencies: spec
	spec
		project: 'Garage-PostgreSQL' with: [
			spec
				className: 'ConfigurationOfGarage';
				version: #stable;
				repository: 'http://smalltalkhub.com/mc/DBXTalk/Garage/main';
				loads: #('postgresV2') ];
		baseline: 'FileDialog' with: [ 
			spec repository: 'github://peteruhnak/file-dialog/repository' ];
		baseline: 'P3' with: [ 
			spec repository: 'github://svenvc/P3' ]