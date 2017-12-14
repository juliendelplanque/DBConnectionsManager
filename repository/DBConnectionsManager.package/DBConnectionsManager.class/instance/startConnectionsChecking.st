connections checking
startConnectionsChecking
	shouldContinueConnectionsChecking := true.
	connectionsCheckerThread := [ 
		[ self connections do: [ :connectionDescription |
			self checkConnection: connectionDescription ].
			self sleepTime wait
		] doWhileTrue: [ shouldContinueConnectionsChecking ]
	] forkNamed: 'DBConnectionsManager''s connections checker'.

	self announceStartedChecking