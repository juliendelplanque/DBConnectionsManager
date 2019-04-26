Class {
	#name : #LtCopyNameToClipboardCommand,
	#superclass : #LtConnectionsManagerWidgetCommand,
	#category : #'DBConnectionsManager-Lieutenant'
}

{ #category : #accessing }
LtCopyNameToClipboardCommand class >> defaultCommandName [
	^ 'Copy name to clipboard'
]

{ #category : #execute }
LtCopyNameToClipboardCommand >> execute [
	Clipboard default clipboardText: self connectionsManagerWidget selectedConnectionDescription name
]
