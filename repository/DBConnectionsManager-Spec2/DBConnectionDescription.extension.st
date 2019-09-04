Extension { #name : #DBConnectionDescription }

{ #category : #'*DBConnectionsManager-Spec2' }
DBConnectionDescription >> asConnectionDescription [
	^ self
]

{ #category : #'*DBConnectionsManager-Spec2' }
DBConnectionDescription >> fillConnectionDescriptionWidget: aConnectionDescriptionWidget [
	aConnectionDescriptionWidget connectionNameInput text: self name.

	aConnectionDescriptionWidget hostnameTextInput text: self hostname.
	
	aConnectionDescriptionWidget databaseTextInput text: self databaseName.
	
	aConnectionDescriptionWidget userTextInput text: self userName.
	
	aConnectionDescriptionWidget passwordTextInput text: self password.
	
	aConnectionDescriptionWidget portTextInput text: self port asString
]
