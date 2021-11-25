Class {
	#name : #ASDHMContact,
	#superclass : #ASDHMModel,
	#instVars : [
		'anrede',
		'vorname',
		'nachname',
		'adressen',
		'telefonNummern',
		'email',
		'type',
		'types',
		'bankVerbindungen'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMContact class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMContact class >> types [ 
^ OrderedCollection
		newFrom: {'admin' . 'projektLeiter' . 'user' . 'costumer'}.
]

{ #category : #accessing }
ASDHMContact >> addAdresse: anObject [

	adressen add: anObject
]

{ #category : #accessing }
ASDHMContact >> addBankVerbindungen: anObject [

	bankVerbindungen add: anObject
]

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
ASDHMContact >> bankVerbindungen [
^ bankVerbindungen ifNil: [ bankVerbindungen := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMContact >> email [

	^ email
]

{ #category : #accessing }
ASDHMContact >> email: anObject [

	email := anObject
]

{ #category : #initialization }
ASDHMContact >> initialize [
	super initialize.
	
	self type: 'costumer'
	
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
ASDHMContact >> telefonNummern: anObject [

	telefonNummern := anObject
]

{ #category : #accessing }
ASDHMContact >> type [

	^ type
]

{ #category : #accessing }
ASDHMContact >> type: anObject [

	type := anObject
]

{ #category : #accessing }
ASDHMContact >> types [

	^ types
]

{ #category : #accessing }
ASDHMContact >> vorname [

	^ vorname
]

{ #category : #accessing }
ASDHMContact >> vorname: anObject [

	vorname := anObject
]
