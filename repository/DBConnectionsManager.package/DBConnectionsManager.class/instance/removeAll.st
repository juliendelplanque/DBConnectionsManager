adding/removing
removeAll
	self connections copy do: [ :connectionDescription |
		self remove: connectionDescription ]