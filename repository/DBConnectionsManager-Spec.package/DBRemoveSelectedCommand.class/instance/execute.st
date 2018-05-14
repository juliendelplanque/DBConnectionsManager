execute
execute
	| toRemove |
	toRemove := self connectionsManagerWidget selectedConnectionDescription.
	self connectionsManagerWidget connectionDescriptionsList unselectConnectionDescription.
	toRemove disconnect.
	self connectionsManager remove: toRemove