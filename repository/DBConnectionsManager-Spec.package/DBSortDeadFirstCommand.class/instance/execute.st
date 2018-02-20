execute
execute
	self connectionsManagerWidget connectionDescriptionsList
		sortingBlock: [ :a :b |
			(a isDead and: [ a name < b name ])
				or: [ a isDead not and: [ b isDead not and: [ a name < b name ] ] ] ]