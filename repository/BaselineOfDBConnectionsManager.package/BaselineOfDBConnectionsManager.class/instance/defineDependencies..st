baselines
defineDependencies: spec
	spec
		project: 'Garage-PostgreSQL' with: [
			spec
				className: 'ConfigurationOfGarage';
				version: #stable;
				repository: 'http://smalltalkhub.com/mc/DBXTalk/Garage/main';
				loads: #('postgresV2') ]