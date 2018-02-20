*DBConnectionsManager-Spec
isAlive
	^ (self privateState at: #iconState) = #testGreen