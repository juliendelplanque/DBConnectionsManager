Extension { #name : #DBDataBaseManagementSystem }

{ #category : #'*DBConnectionsManager-Garage' }
DBDataBaseManagementSystem >> buildGarageConnectionFrom: aDBConnectionDescription [
	^ GADriver fromConnectionString: (self buildGarageUrlFrom: aDBConnectionDescription)
]

{ #category : #'*DBConnectionsManager-Garage' }
DBDataBaseManagementSystem >> buildGarageUrlFrom: aDBConnectionDescription [
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
]

{ #category : #'*DBConnectionsManager-Garage' }
DBDataBaseManagementSystem >> garageDriverName [
	^ self subclassResponsibility
]

{ #category : #'*DBConnectionsManager-Garage' }
DBDataBaseManagementSystem class >> useGarageDriver [
	self connectionBuildingSymbol: #buildGarageConnectionFrom:
]
