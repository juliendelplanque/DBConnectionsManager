"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #DBPHeader,
	#superclass : #DBPComponent,
	#category : #'DBConnectionsManager-MDL'
}

{ #category : #accessing }
DBPHeader >> connectionPages [
	^ DBConnectionsManager current connections collect: #asDBConnectionPage
]

{ #category : #rendering }
DBPHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ 
			html
				mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: 'Database plateform' ].
					html mdlLayoutSpacer.
					html text: 'Version 0.0.0'. ] ].
	self renderDrawerOn: html
]

{ #category : #rendering }
DBPHeader >> renderDrawerOn: html [
	html
		mdlLayoutDrawer: [ 
			html
				mdlNavigation: [ 
					self connectionPages
						do: [ :connection | 
							html mdlNavigationLink
								beCurrentIf: connection = self rootComponent componentToDisplay;
								callback: [ self display: connection ];
								with: connection pageName ] ] ]
]
