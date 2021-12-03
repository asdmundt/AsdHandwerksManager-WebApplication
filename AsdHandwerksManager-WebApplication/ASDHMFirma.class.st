Class {
	#name : #ASDHMFirma,
	#superclass : #ASDHMModel,
	#instVars : [
		'name',
		'adressen',
		'firmenForm',
		'bankVerbindungen',
		'firmenSitz',
		'amtsgerichtSitz',
		'hre',
		'steuerNr',
		'umsatzSteuer',
		'geschaeftsFuehrer'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMFirma class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMFirma >> addAdresse: anObject [

	adressen add: anObject
]

{ #category : #accessing }
ASDHMFirma >> addBankverbindungen: anObject [

	bankVerbindungen  add: anObject
]

{ #category : #accessing }
ASDHMFirma >> adressen [
^ adressen ifNil: [ adressen := OrderedCollection new ]
	
]

{ #category : #accessing }
ASDHMFirma >> adressen: anObject [

	adressen := anObject
]

{ #category : #accessing }
ASDHMFirma >> amtsgerichtSitz [

	^ amtsgerichtSitz
]

{ #category : #accessing }
ASDHMFirma >> amtsgerichtSitz: anObject [

	amtsgerichtSitz := anObject
]

{ #category : #accessing }
ASDHMFirma >> bankVerbindungen [
^ bankVerbindungen ifNil: [ bankVerbindungen := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMFirma >> bankVerbindungen: anObject [

	bankVerbindungen := anObject
]

{ #category : #accessing }
ASDHMFirma >> firmenForm [

	^ firmenForm
]

{ #category : #accessing }
ASDHMFirma >> firmenForm: anObject [

	firmenForm := anObject
]

{ #category : #accessing }
ASDHMFirma >> firmenSitz [

	^ firmenSitz
]

{ #category : #accessing }
ASDHMFirma >> firmenSitz: anObject [

	firmenSitz := anObject
]

{ #category : #accessing }
ASDHMFirma >> geschaeftsFuehrer [

	^ geschaeftsFuehrer
]

{ #category : #accessing }
ASDHMFirma >> geschaeftsFuehrer: anObject [

	geschaeftsFuehrer := anObject
]

{ #category : #accessing }
ASDHMFirma >> hre [

	^ hre
]

{ #category : #accessing }
ASDHMFirma >> hre: anObject [

	hre := anObject
]

{ #category : #initialization }
ASDHMFirma >> initialize [
	super initialize.
	self adressen: OrderedCollection new.
	self bankVerbindungen: OrderedCollection new.
	
	
]

{ #category : #accessing }
ASDHMFirma >> name [

	^ name
]

{ #category : #accessing }
ASDHMFirma >> name: anObject [

	name := anObject
]

{ #category : #accessing }
ASDHMFirma >> steuerNr [

	^ steuerNr
]

{ #category : #accessing }
ASDHMFirma >> steuerNr: anObject [

	steuerNr := anObject
]

{ #category : #accessing }
ASDHMFirma >> umsatzSteuer [

	^ umsatzSteuer
]

{ #category : #accessing }
ASDHMFirma >> umsatzSteuer: anObject [

	umsatzSteuer := anObject
]
