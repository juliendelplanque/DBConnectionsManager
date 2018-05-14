accessing
connectionBuildingSymbol
	^ ConnectionBuildingSymbol ifNil: [ 
		self useNullDriver.
		ConnectionBuildingSymbol ]