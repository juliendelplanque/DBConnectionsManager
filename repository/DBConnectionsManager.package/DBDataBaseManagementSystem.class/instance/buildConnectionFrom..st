connection building
buildConnectionFrom: aDBConnectionDescription
	^ GADriver fromConnectionString: (self buildUrlFrom: aDBConnectionDescription)