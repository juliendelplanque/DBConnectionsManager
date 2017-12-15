api
connect
	connection := GADriver fromConnectionString: self connectionUrl.
	connection connect.
	
	self hasAlreadyConnect: true