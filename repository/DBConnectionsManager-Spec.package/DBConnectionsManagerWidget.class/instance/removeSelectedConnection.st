list menu actions
removeSelectedConnection
	| toRemove |
	toRemove := self connectionDescriptionsList selectedConnectionDescription.
	self connectionDescriptionsList unselectConnectionDescription.
	connectionsManager remove: toRemove