api
execute: aString
	"Execute the SQL query contained in #aString on the DB connected."
	| toReturn |
	self connection
		ifNil: [ self error: 'Please connect to the database before trying to execute a query!' ].

	toReturn := self connection execute: aString.
	
	self announcer announce: ((DBQueryExecutedAnnouncement connectionDescription: self)
										queryString: aString;
										yourself).
	
	^ toReturn