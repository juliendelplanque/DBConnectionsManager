public api
testConnection
	[ self asDBConnectionDescription
		connect;
		isAlive;
		disconnect
	] on: Error do: [ :error | UIManager default alert: error messageText title: 'Connection test failed.'. ^ self ].

	UIManager default proceed: 'Connection works perfectly.' title: 'Connection test result'