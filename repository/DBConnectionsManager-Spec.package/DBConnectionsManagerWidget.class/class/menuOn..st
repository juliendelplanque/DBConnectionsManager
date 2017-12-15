menu
menuOn: aBuilder
	<worldMenu>
	(aBuilder item: #'DB connections manager')
		iconName: #testGreen;
		parent: #DBTools;
		action: [ self error: 'Should open DBConnectionsManagerWidget' ].
		
	aBuilder withSeparatorAfter