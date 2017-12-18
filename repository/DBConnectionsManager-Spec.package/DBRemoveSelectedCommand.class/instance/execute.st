execute
execute
	| toRemove |
	toRemove := self connectionsManagerWidget selectedConnectionDescription.
	self connectionsManagerWidget connectionDescriptionsList unselectConnectionDescription.
	self connectionsManager remove: toRemove