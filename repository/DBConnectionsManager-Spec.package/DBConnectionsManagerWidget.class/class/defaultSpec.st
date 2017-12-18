specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :mainRow |
			mainRow
				newColumn: [ :leftColumn |
					leftColumn
						newRow: #newConnectionButton height: self buttonHeight;
						newRow: #connectionDescriptionsList;
						newRow: #threadCheckerButton height: self buttonHeight ];
				addSplitter;
				newColumn: #connectionDescriptionEditor ]