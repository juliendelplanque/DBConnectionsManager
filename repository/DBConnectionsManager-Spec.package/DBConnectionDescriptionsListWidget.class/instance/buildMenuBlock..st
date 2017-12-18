api
buildMenuBlock: aBlock
	self connectionDescriptionsList menu: [ :builder |
		aBlock value: builder.
		builder ]