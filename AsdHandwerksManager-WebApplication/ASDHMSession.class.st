Class {
	#name : #ASDHMSession,
	#superclass : #WASession,
	#instVars : [
		'currentUser',
		'rootComponent',
		'task',
		'model',
		'loginError',
		'adminView',
		'userId',
		'modelErp',
		'shop'
	],
	#category : #'AsdHandwerksManager-WebApplication-Utils'
}

{ #category : #accessing }
ASDHMSession >> adminView [
	^ adminView
]

{ #category : #accessing }
ASDHMSession >> adminView: anObject [
	adminView := anObject
]

{ #category : #accessing }
ASDHMSession >> currentUser [
	^ currentUser
]

{ #category : #accessing }
ASDHMSession >> currentUser: anObject [
	currentUser := anObject
]

{ #category : #initialization }
ASDHMSession >> initialize [
	super initialize.
	self model: ASDEDbModelPortal current.
	self modelErp: ASDEDbModelPortalErp current.
	self adminView: false
]

{ #category : #testing }
ASDHMSession >> isLogged [
	^ self currentUser notNil
]

{ #category : #accessing }
ASDHMSession >> loginError [
	^ loginError
]

{ #category : #accessing }
ASDHMSession >> loginError: anObject [
	loginError := anObject
]

{ #category : #accessing }
ASDHMSession >> model [
	^ model
]

{ #category : #accessing }
ASDHMSession >> model: anObject [
	model := anObject
]

{ #category : #accessing }
ASDHMSession >> modelErp [
	^ modelErp
]

{ #category : #accessing }
ASDHMSession >> modelErp: anObject [
	modelErp := anObject
]

{ #category : #actions }
ASDHMSession >> reset [
		currentUser := nil.
	self requestContext redirectTo: self application url.
	self unregister
]

{ #category : #actions }
ASDHMSession >> resetStates [
	task := nil
]

{ #category : #accessing }
ASDHMSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
ASDHMSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]

{ #category : #accessing }
ASDHMSession >> shop [
	^ shop
]

{ #category : #accessing }
ASDHMSession >> shop: anObject [
	shop := anObject
]

{ #category : #accessing }
ASDHMSession >> task [
	^ task
]

{ #category : #accessing }
ASDHMSession >> task: anObject [
	task := anObject
]

{ #category : #accessing }
ASDHMSession >> userId [
	^ userId
]

{ #category : #accessing }
ASDHMSession >> userId: anObject [
	userId := anObject
]
