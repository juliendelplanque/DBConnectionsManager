Extension { #name : #DBConnectionDescription }

{ #category : #'*DBConnectionsManager-Serializer' }
DBConnectionDescription >> asDictionaryForSerialization [
	"Returns a dictionary containing the data for serialization.
	 The name of inst. var. directly map to the dictionary's keys.
	"
	^ { 
		'name' -> self name.
		'hostname' -> self hostname.
		'port' -> self port.
		'databaseName' -> self databaseName.
		'userName' -> self userName.
		'password' -> self password.
		'dbms' -> self dbms name
	} asDictionary
]
