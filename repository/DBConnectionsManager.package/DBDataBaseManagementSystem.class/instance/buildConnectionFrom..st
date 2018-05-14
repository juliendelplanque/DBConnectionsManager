connection building
buildConnectionFrom: aDBConnectionDescription
	^ GADriver fromConnectionString: (self buildGarageUrlFrom: aDBConnectionDescription)