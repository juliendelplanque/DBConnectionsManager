public api
cancelButtonAction: aBlock
	cancelButton
		action: [ 
			[
				aBlock cull: self
			] on: Error do: [ :err | UIManager default alert: err messageText title: 'Error while cancelling.' ] ]