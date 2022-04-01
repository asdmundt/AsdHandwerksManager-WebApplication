Class {
	#name : #ASDHMVorgang,
	#superclass : #ASDHMModel,
	#instVars : [
		'aufgaben',
		'userErsteller',
		'title',
		'descr'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #accessing }
ASDHMVorgang >> aufgaben [

	^ aufgaben
]

{ #category : #accessing }
ASDHMVorgang >> aufgaben: anObject [

	aufgaben := anObject
]

{ #category : #accessing }
ASDHMVorgang >> userErsteller [

	^ userErsteller
]

{ #category : #accessing }
ASDHMVorgang >> userErsteller: anObject [

	userErsteller := anObject
]
