specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: #connectionDescriptionsList ]