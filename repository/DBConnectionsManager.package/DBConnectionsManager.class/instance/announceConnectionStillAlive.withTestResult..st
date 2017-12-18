announcing
announceConnectionStillAlive: aDBConnectionDescription withTestResult: testResult
	self announce: ((DBConnectionStillAlive connectionDescription: aDBConnectionDescription)
							testResult: testResult
							yourself)