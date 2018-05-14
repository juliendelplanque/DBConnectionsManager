*DBConnectionsManager-Garage
buildGarageUrlFrom: aDBConnectionDescription
	^ String streamContents: [ :stream |
		stream
			<< self garageDriverName;
			<< '://';
			<< aDBConnectionDescription hostname;
			<< $:;
			<< aDBConnectionDescription port asString;
			<< $/;
			<< aDBConnectionDescription databaseName;
			<< '?user=';
			<< aDBConnectionDescription userName;
			<< '&password=';
			<< aDBConnectionDescription password ]