initialization
initializeConnectionDescriptionsList
	self connectionDescriptionsList
		whenSelectedItemChanged: [ :item | 
			item
				ifNotNil: [ self connectionDescriptionEditor
						enabled: true;
						fillFieldsFrom: item ]
				ifNil: [ self connectionDescriptionEditor
						enabled: false;
						clearFields ] ];
		buildMenuBlock: [ :builder | 
			self buildListMenuOn: builder ]