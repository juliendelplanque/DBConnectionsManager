Class {
	#name : #DBCopyNameToClipboardCommand2,
	#superclass : #DBSingleConnectionWidgetCommand2,
	#category : #'DBConnectionsManager-Spec2-Commands'
}

{ #category : #accessing }
DBCopyNameToClipboardCommand2 class >> defaultName [
	^ 'Copy name to clipboard'
]

{ #category : #execute }
DBCopyNameToClipboardCommand2 >> execute [
	Clipboard default clipboardText: self selectedConnectionDescription name
]
