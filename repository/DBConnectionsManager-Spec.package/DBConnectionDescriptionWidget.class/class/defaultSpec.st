specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				newRow: [ :row |
					row
						add: #connectionNameLabel;
						add: #connectionNameInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #hostnameLabel;
						add: #hostnameTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #portLabel;
						add: #portTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #databaseLabel;
						add: #databaseTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #userLabel;
						add: #userTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #passwordLabel;
						add: #passwordTextInput ] height: self inputTextHeight;
				newRow: [ :row |
					row
						add: #testConnectionButton;
						add: #cancelButton;
						add: #okButton ] height: self buttonHeight ]