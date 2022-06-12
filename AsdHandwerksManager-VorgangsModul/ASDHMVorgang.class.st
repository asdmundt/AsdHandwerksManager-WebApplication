Class {
	#name : #ASDHMVorgang,
	#superclass : #ASDHMModel,
	#instVars : [
		'aufgaben',
		'userErsteller',
		'title',
		'descr'
	],
	#category : #'AsdHandwerksManager-VorgangsModul-Model'
}

{ #category : #voyage }
ASDHMVorgang class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMVorgang class >> titleText [

	^ 'Vorgang'
]

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
