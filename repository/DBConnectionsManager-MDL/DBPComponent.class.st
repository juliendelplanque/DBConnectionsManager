"
Description
--------------------

Abstract superclass of all Seaside components of DBPlateform. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #DBPComponent,
	#superclass : #WAComponent,
	#category : #'DBConnectionsManager-MDL'
}

{ #category : #convenience }
DBPComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
DBPComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
DBPComponent >> rootComponent [
	^ self session rootComponent
]
