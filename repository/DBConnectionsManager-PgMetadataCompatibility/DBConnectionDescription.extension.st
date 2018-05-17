Extension { #name : #DBConnectionDescription }

{ #category : #'*DBConnectionsManager-PgMetadataCompatibility' }
DBConnectionDescription >> getConnectionString [
	^ String streamContents: [ :stream |
		stream
			<< 'postgresV2';
			<< '://';
			<< self hostname;
			<< $:;
			<< self port asString;
			<< $/;
			<< self databaseName;
			<< '?user=';
			<< self userName;
			<< '&password=';
			<< self password ]
]
