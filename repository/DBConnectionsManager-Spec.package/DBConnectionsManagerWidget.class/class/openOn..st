opening
openOn: aDBConnectionsManager
	^ self new
		adaptToConnectionsManager: aDBConnectionsManager;
		openWithSpec;
		yourself