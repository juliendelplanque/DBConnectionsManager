public api
asDBConnectionDescription
	"Return a new DBConnectionDescription instance adapted to what is in my input fields."
	^ self adaptToMyself: (DBConnectionDescription for: self dbmsDropList selectedItem new)