accessing
dbmsNamed: aString
	^ (DBDataBaseManagementSystem subclasses detect: [ :c | c dbmsName = aString ]) new