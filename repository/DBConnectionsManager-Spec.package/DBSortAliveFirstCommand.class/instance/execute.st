execute
execute
	self connectionsManagerWidget connectionDescriptionsList
		sortingBlock: [ :a :b |
			(a isAlive and: [ a name < b name ])
				or: [ a isAlive not and: [ b isAlive not and: [ a name < b name ] ] ] ]