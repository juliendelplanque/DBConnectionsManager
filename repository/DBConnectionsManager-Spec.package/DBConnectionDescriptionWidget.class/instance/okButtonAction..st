public api
okButtonAction: aBlock
	okButton
		action: [ 
			[
				self checkInputsMatchRegexes.
				aBlock cull: self
			] on: Error do: [ :err | UIManager default alert: err messageText title: 'Could not create the connection description' ] ]