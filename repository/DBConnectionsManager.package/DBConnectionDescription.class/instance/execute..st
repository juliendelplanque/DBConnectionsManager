api
execute: aString
	"Execute the SQL query contained in #aString on the DB connected."
	self connection
		ifNil: [ self error: 'Please connect to the database before trying to execute a query!' ].

	^ self connection execute: aString