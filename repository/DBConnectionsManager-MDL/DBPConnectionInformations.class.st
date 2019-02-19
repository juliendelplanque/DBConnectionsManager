Class {
	#name : #DBPConnectionInformations,
	#superclass : #DBPConnectionTabPage,
	#category : #'DBConnectionsManager-MDL'
}

{ #category : #accessing }
DBPConnectionInformations class >> tabName [
	^ 'Informations'
]

{ #category : #accessing }
DBPConnectionInformations class >> weight [
	^ 0
]

{ #category : #rendering }
DBPConnectionInformations >> renderContentOn: html [
	html mdlTable
		with: [ html mdlCell
				size: 12;
				with: [ html mdlTable
						shadow: 2;
						with: [ self renderTableHeadOn: html.
							self renderTableBodyOn: html ] ] ]
]

{ #category : #rendering }
DBPConnectionInformations >> renderTableBodyOn: html [
	html
		tableBody: [ html
				tableRow: [ html mdlTableCell
						nonNumerical;
						with: 'Hostname'.
					html mdlTableCell
						nonNumerical;
						with: self connection hostname ].
			html
				tableRow: [ html mdlTableCell
						nonNumerical;
						with: 'Port'.
					html mdlTableCell
						nonNumerical;
						with: self connection port ] ]
]

{ #category : #rendering }
DBPConnectionInformations >> renderTableHeadOn: html [
	html
		tableHead: [ html mdlTableHeading
				nonNumerical;
				with: 'Property'.
			html mdlTableHeading
				nonNumerical;
				with: 'Value' ]
]
