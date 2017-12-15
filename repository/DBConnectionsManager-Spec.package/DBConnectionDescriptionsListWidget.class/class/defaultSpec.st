specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: #newConnectionButton height: self buttonHeight;
				newRow: #connectionDescriptionsList ]