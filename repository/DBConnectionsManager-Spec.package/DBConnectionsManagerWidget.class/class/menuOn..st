menu
menuOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DB Connections Manager')
		iconName: #glamorousThrough;
		parent: #'MooSQL';
		action: [ 
			self new
				adaptToConnectionsManager: DBConnectionsManager current;
				openWithSpec ].
		
	aBuilder withSeparatorAfter