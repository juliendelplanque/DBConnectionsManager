api
test
	"
	Perform a query on the database to verify the connection is alive.
	
	Returns a DBConnectionTestResult.
	"
	|startTime endTime|
	[ 
		startTime := DateAndTime now.
		self execute: 'SELECT 1;'.
		endTime := DateAndTime now
	 ] on: Error do: [ 
		^ DBConnectionTestResult new
			startTime: startTime;
			isAlive: false;
			yourself
	].
	
	^ DBConnectionTestResult new
			startTime: startTime;
			endTime: endTime;
			isAlive: true;
			yourself