url building
buildUrlFrom: aDBConnectionDescription
	^ String streamContents: [ :stream |
		stream
			<< self driverName;
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