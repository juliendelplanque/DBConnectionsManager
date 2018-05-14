*DBConnectionsManager-P3
buildP3UrlFrom: aDBConnectionDescription
	"psql://username:password@localhost:5432/databasename"
	^ String streamContents: [ :stream |
		stream
			<< 'psql://';
			<< aDBConnectionDescription userName;
			<< $:;
			<< aDBConnectionDescription password;
			<< $@;
			<< aDBConnectionDescription hostname;
			<< $:;
			<< aDBConnectionDescription port asString;
			<< $/;
			<< aDBConnectionDescription databaseName ]