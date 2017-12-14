announcing
announce: aDBConnectionsManagerAnnouncement
	"Set the #connectionsManager of the announcement given as argument to be myself and announce it using my #announcer."
	aDBConnectionsManagerAnnouncement
		connectionsManager: self.
	
	self announcer
		announce: aDBConnectionsManagerAnnouncement