public api
okButtonAction: aBlock
	okButton
		action: [ self checkInputsMatchRegexes.
			aBlock value: self ]