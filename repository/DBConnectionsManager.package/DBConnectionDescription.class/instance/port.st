accessing
port
	^ port ifNil: [ self dbms defaultConnectionPort ]