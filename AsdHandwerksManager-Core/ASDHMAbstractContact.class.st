Class {
	#name : #ASDHMAbstractContact,
	#superclass : #ASDHMModel,
	#instVars : [
		'anrede',
		'vorname',
		'nachname',
		'title',
		'adressen',
		'mobilFunkNr',
		'telefonNummer',
		'email',
		'type',
		'types',
		'bankVerbindungen'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #testing }
ASDHMAbstractContact class >> isAbstract [
	^ self = ASDHMAbstractContact
]

{ #category : #voyage }
ASDHMAbstractContact class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMAbstractContact class >> titleText [
^''
]

{ #category : #accessing }
ASDHMAbstractContact >> addAdresse: anObject [

	adressen add: anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> addBankVerbindungen: anObject [

	bankVerbindungen add: anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> adressen [
^ adressen ifNil: [ adressen := OrderedCollection new ]
	
]

{ #category : #accessing }
ASDHMAbstractContact >> adressen: anObject [

	adressen := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> anrede [

	^ anrede
]

{ #category : #accessing }
ASDHMAbstractContact >> anrede: anObject [

	anrede := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> bankVerbindungen [
^ bankVerbindungen ifNil: [ bankVerbindungen := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMAbstractContact >> bankVerbindungen: anObject [

	bankVerbindungen := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> email [

	^ email
]

{ #category : #accessing }
ASDHMAbstractContact >> email: anObject [

	email := anObject
]

{ #category : #initialization }
ASDHMAbstractContact >> initialize [

	super initialize. self adressen: OrderedCollection new.
	self bankVerbindungen: OrderedCollection new
]

{ #category : #accessing }
ASDHMAbstractContact >> mobilFunkNr [

	^ mobilFunkNr
]

{ #category : #accessing }
ASDHMAbstractContact >> mobilFunkNr: anObject [

	mobilFunkNr := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> nachname [

	^ nachname ifNil: [ 
		  nachname := '']
]

{ #category : #accessing }
ASDHMAbstractContact >> nachname: anObject [

	nachname := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> telefonNummer [

	^ telefonNummer
]

{ #category : #accessing }
ASDHMAbstractContact >> telefonNummer: anObject [

	telefonNummer := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> title [

	^ title
]

{ #category : #accessing }
ASDHMAbstractContact >> title: anObject [

	title := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> vorname [

	^ vorname ifNil: [ vorname := '' ]
]

{ #category : #accessing }
ASDHMAbstractContact >> vorname: anObject [

	vorname := anObject
]
