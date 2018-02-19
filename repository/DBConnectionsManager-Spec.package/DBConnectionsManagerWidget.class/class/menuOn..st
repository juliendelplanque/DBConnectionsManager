menu
menuOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DB Connections Manager')
		iconName: #glamorousThrough;
		parent: #DBTools;
		action: [ 
			self new
				adaptToConnectionsManager: DBConnectionsManager current;
				openWithSpec ].
		
	aBuilder withSeparatorAfter