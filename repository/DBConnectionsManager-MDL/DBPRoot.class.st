"
Description
--------------------

I am the root component of DBPlateform. I will contain every components of the application to display.

I have a header.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	componentInstances:			<aDictionary>	A dictionary keeping for each component class, an instance. This instance can be use when the user change of page to come pack to a previous page.
	componentToDisplay:		<aComponent>	The current page to display as the root content.
	header:						<aComponent>	The header of the page.

"
Class {
	#name : #DBPRoot,
	#superclass : #DBPComponent,
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances'
	],
	#category : #'DBConnectionsManager-MDL'
}

{ #category : #testing }
DBPRoot class >> canBeRoot [
	^ true
]

{ #category : #initialization }
DBPRoot class >> initialize [
		self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ]. "Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'DBPlateform')
		preferenceAt: #sessionClass put: DBPSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: DBPLibrary;
		yourself
]

{ #category : #'world menu' }
DBPRoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #DBPlateform)
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ] ]
]

{ #category : #'instance creation' }
DBPRoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/DBPlateform'
]

{ #category : #hooks }
DBPRoot >> children [
	^ { self header. self componentToDisplay }
]

{ #category : #accessing }
DBPRoot >> componentInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ componentInstances
]

{ #category : #accessing }
DBPRoot >> componentInstances: aDictionary [
	componentInstances := aDictionary
]

{ #category : #accessing }
DBPRoot >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
DBPRoot >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
DBPRoot >> defaultHeader [
	^ DBPHeader new
]

{ #category : #updating }
DBPRoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
DBPRoot >> header [
	^ header
]

{ #category : #accessing }
DBPRoot >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
DBPRoot >> initialRequest: aRequest [
	| consumer pageName |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.
	
	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"
	
	"Try to find a page corresponding"
	self header connectionPages
		detect: [ :each | each pathName asLowercase = pageName ]
		ifFound: [ :class | 
			self displayInstanceOf: class.

			"If we find a page, we pop the subpart of the path corresponding to the page."
			consumer next ]
]

{ #category : #initialization }
DBPRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self display: DBConnectionsManager current connections first asDBConnectionPage; flag: #TODO
]

{ #category : #rendering }
DBPRoot >> renderContentOn: html [
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'dbplateform';
								size: 12;
								with: [ html render: self componentToDisplay ] ]] ]
]

{ #category : #hooks }
DBPRoot >> style [
	^ '.mdl-pagination__current{
        box-shadow: inset 0px -4px 0px 0px #E91E63 !important;
    }'
]

{ #category : #updating }
DBPRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Database plateform'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.deep_purple-pink.min.css')
]

{ #category : #updating }
DBPRoot >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
