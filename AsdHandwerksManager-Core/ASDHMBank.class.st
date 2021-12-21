Class {
	#name : #ASDHMBank,
	#superclass : #ASDHMModel,
	#instVars : [
		'bankName',
		'Iban',
		'Bic',
		'KontoInhaber',
		'bankObjectId'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMBank class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMBank class >> kontoInhaber: aString [
	^ self new
		kontoInhaber: aString;
		yourself
]

{ #category : #accessing }
ASDHMBank >> bankName [

	^ bankName
]

{ #category : #accessing }
ASDHMBank >> bankName: anObject [

	bankName := anObject
]

{ #category : #accessing }
ASDHMBank >> bankObjectId [

	^ bankObjectId
]

{ #category : #accessing }
ASDHMBank >> bankObjectId: anObject [

	bankObjectId := anObject
]

{ #category : #accessing }
ASDHMBank >> bic [

	^ Bic
]

{ #category : #accessing }
ASDHMBank >> bic: anObject [

	Bic := anObject
]

{ #category : #accessing }
ASDHMBank >> iban [

	^ Iban
]

{ #category : #accessing }
ASDHMBank >> iban: anObject [

	Iban := anObject
]

{ #category : #initialization }
ASDHMBank >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMBank >> kontoInhaber [

	^ KontoInhaber
]

{ #category : #accessing }
ASDHMBank >> kontoInhaber: anObject [

	KontoInhaber := anObject
]
