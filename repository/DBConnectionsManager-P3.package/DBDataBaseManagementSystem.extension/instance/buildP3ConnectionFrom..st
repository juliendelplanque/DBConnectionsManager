*DBConnectionsManager-P3
buildP3ConnectionFrom: aDBConnectionDescription
	^ P3Client new
		url: (self buildP3UrlFrom: aDBConnectionDescription);
		yourself