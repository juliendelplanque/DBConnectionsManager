Extension { #name : #DBDataBaseManagementSystem }

{ #category : #'*DBConnectionsManager-P3' }
DBDataBaseManagementSystem >> buildP3ConnectionFrom: aDBConnectionDescription [
	^ P3Client new
		url: (self buildP3UrlFrom: aDBConnectionDescription);
		yourself
]

{ #category : #'*DBConnectionsManager-P3' }
DBDataBaseManagementSystem >> buildP3UrlFrom: aDBConnectionDescription [
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
]

{ #category : #'*DBConnectionsManager-P3' }
DBDataBaseManagementSystem class >> useP3Driver [
	<dbcmDriverSetter>
	ConnectionBuildingSymbol := #buildP3ConnectionFrom:
]
