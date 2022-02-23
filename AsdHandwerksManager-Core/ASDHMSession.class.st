Class {
	#name : #ASDHMSession,
	#superclass : #WASession,
	#instVars : [
		'currentUser',
		'rootComponent',
		'task',
		'model',
		'modelMalerGewerk',
		'modelBlz',
		'loginError',
		'adminView',
		'userId',
		'firma',
		'firmenId',
		'currentObject',
		'loggedUsers',
		'leistungen'
	],
	#category : #'AsdHandwerksManager-Core-Utils'
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
ASDHMSession >> currentObject [

	^ currentObject
]

{ #category : #accessing }
ASDHMSession >> currentObject: anObject [

	currentObject := anObject
]

{ #category : #accessing }
ASDHMSession >> currentUser [
	^ currentUser
]

{ #category : #accessing }
ASDHMSession >> currentUser: anObject [
	currentUser := anObject
]

{ #category : #accessing }
ASDHMSession >> firma [

	^ firma
]

{ #category : #accessing }
ASDHMSession >> firma: anObject [

	firma := anObject
]

{ #category : #accessing }
ASDHMSession >> firmenId [

	^ firmenId
]

{ #category : #accessing }
ASDHMSession >> firmenId: anObject [

	firmenId := anObject
]

{ #category : #initialization }
ASDHMSession >> initialize [
	super initialize.
	self model: ASDHMDbModelBase current.
	self modelBlz: ASDHMDbModelBlz current.
	self modelMalerGewerk: ASDHMDbModelMalerGewerg current.
	self adminView: false
]

{ #category : #testing }
ASDHMSession >> isLogged [
	^ self currentUser notNil
]

{ #category : #accessing }
ASDHMSession >> leistungen [

	^ leistungen ifNil: [ leistungen := self model leistungen ]
]

{ #category : #accessing }
ASDHMSession >> loggedUsers [

	^ loggedUsers ifNil: [ loggedUsers := OrderedCollection new ]

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
ASDHMSession >> modelBlz [

	^ modelBlz
]

{ #category : #accessing }
ASDHMSession >> modelBlz: anObject [

	modelBlz := anObject
]

{ #category : #accessing }
ASDHMSession >> modelMalerGewerk [

	^ modelMalerGewerk
]

{ #category : #accessing }
ASDHMSession >> modelMalerGewerk: anObject [

	modelMalerGewerk := anObject
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
