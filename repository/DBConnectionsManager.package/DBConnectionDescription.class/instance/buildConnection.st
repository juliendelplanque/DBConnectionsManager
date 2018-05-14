api
buildConnection
	"Build a connection using the current driver. While this connection is not an object implemented in one of the DBC* package, it understands:
	- #dbcmConnect
	- #dbcmDisconnect
	- #dbcmExecute:
	"
	^ self dbms buildConnectionFrom: self