Class {
	#name : #ASDHMContact,
	#superclass : #ASDHMModel,
	#instVars : [
		'anrede',
		'vorname',
		'nachname',
		'adressen',
		'telefonNummern',
		'email'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #accessing }
ASDHMContact >> adressen [
^ adressen ifNil: [ adressen := OrderedCollection new ]
	
]

{ #category : #accessing }
ASDHMContact >> anrede [

	^ anrede
]

{ #category : #accessing }
ASDHMContact >> anrede: anObject [

	anrede := anObject
]

{ #category : #accessing }
ASDHMContact >> email [

	^ email
]

{ #category : #accessing }
ASDHMContact >> email: anObject [

	email := anObject
]

{ #category : #accessing }
ASDHMContact >> nachname [

	^ nachname
]

{ #category : #accessing }
ASDHMContact >> nachname: anObject [

	nachname := anObject
]

{ #category : #accessing }
ASDHMContact >> telefonNummern [
^ telefonNummern ifNil: [ telefonNummern := OrderedCollection new ]

]

{ #category : #accessing }
ASDHMContact >> vorname [

	^ vorname
]

{ #category : #accessing }
ASDHMContact >> vorname: anObject [

	vorname := anObject
]
