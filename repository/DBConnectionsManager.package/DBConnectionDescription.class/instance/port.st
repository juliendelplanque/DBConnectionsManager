accessing
port
	^ port ifNil: [ self database defaultConnectionPort ]