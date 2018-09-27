"
Copy the name of the connection selected in the clipboard.
"
Class {
	#name : #DBCopyNameToClipboardCommand,
	#superclass : #DBConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Spec-Commands'
}

{ #category : #accessing }
DBCopyNameToClipboardCommand class >> commandName [
	^ 'Copy name to clipboard'
]

{ #category : #testing }
DBCopyNameToClipboardCommand class >> isForSingleConnection [
	^ true
]

{ #category : #accessing }
DBCopyNameToClipboardCommand class >> weight [
	^ 500
]

{ #category : #execute }
DBCopyNameToClipboardCommand >> execute [
	Clipboard default clipboardText: self connectionsManagerWidget selectedConnectionDescription name
]
