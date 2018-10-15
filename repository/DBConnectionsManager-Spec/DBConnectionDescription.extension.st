Extension { #name : #DBConnectionDescription }

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> beAlive [
	self privateState at: #iconState put: #testGreen
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> beDead [
	self privateState at: #iconState put: #testRed
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> beNotConnectable [
	self privateState at: #iconState put: #changeRemove
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> beUnchecked [
	self privateState at: #iconState put: #testYellow
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> beUnknown [
	self privateState at: #iconState put: #testNotRun
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> iconState [
	^ self privateState at: #iconState ifAbsent: [ 
			self beUnknown.
			self privateState at: #iconState ]
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> isAlive [
	^ (self privateState at: #iconState) = #testGreen
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> isDead [
	^ (self privateState at: #iconState) = #testRed
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> isUnchecked [
	^ (self privateState at: #iconState) = #testYellow
]

{ #category : #'*DBConnectionsManager-Spec' }
DBConnectionDescription >> isUnknown [
	^ (self privateState at: #iconState) = #testNotRun
]
