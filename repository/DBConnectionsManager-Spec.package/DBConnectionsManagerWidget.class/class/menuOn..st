menu
menuOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DB connections manager')
		iconName: #testGreen;
		parent: #DBTools;
		action: [ 
			self new
				adaptToConnectionsManager: DBConnectionsManager current;
				openWithSpec ].
		
	aBuilder withSeparatorAfter