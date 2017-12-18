announcing
announceConnectionRevive: aDBConnectionDescription withTestResult: testResult
	self announce: ((DBConnectionRevive connectionDescription: aDBConnectionDescription)
							testResult: testResult
							yourself)