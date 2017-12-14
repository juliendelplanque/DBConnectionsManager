api
isAlive
	"
	Perform a query on the database to verify the connection is alive.
	
	Returns true if the query executed succesfully. Else returns false.
	If the database was not connected, this will return false.
	"
	[ self execute: 'SELECT 1' ]
		on: Error
		do: [ ^ false ].
	
	^ true