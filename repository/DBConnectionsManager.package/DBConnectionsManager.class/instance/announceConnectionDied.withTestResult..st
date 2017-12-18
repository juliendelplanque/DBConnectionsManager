announcing
announceConnectionDied: aDBConnectionDescription withTestResult: testResult
	self announce: ((DBConnectionDied connectionDescription: aDBConnectionDescription)
							testResult: testResult
							yourself)