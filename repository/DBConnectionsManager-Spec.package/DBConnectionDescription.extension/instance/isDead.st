*DBConnectionsManager-Spec
isDead
	^ (self privateState at: #iconState) = #testRed