*DBConnectionsManager-Spec
iconState
	^ self privateState at: #iconState ifAbsent: [ 
			self beUnknown.
			self privateState at: #iconState ]