Class {
	#name : #ASDHMAbstractContact,
	#superclass : #ASDHMModel,
	#instVars : [
		'anrede',
		'vorname',
		'nachname',
		'title',
		'mobilFunkNr',
		'telefonNummer',
		'email',
		'bankVerbindungen',
		'str',
		'hsnr',
		'plz',
		'ort',
		'bankName',
		'Iban',
		'Bic',
		'KontoInhaber'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #testing }
ASDHMAbstractContact class >> isAbstract [
	"^ self = ASDHMAbstractContact"
	^false
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
ASDHMAbstractContact >> addBankVerbindungen: anObject [

	bankVerbindungen add: anObject
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
ASDHMAbstractContact >> bankName [

	^ bankName
]

{ #category : #accessing }
ASDHMAbstractContact >> bankName: anObject [

	bankName := anObject
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
ASDHMAbstractContact >> bic [

	^ Bic
]

{ #category : #accessing }
ASDHMAbstractContact >> bic: anObject [

	Bic := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> displayString [

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: self anrede;
			  space;
			  nextPutAll: self title;
			  space;
			  nextPutAll: self vorname;
			  space;
			  nextPutAll: self nachname;
			 
			  space ]
]

{ #category : #accessing }
ASDHMAbstractContact >> email [

	^ email
]

{ #category : #accessing }
ASDHMAbstractContact >> email: anObject [

	email := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> hsnr [

	^ hsnr
]

{ #category : #accessing }
ASDHMAbstractContact >> hsnr: anObject [

	hsnr := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> iban [

	^ Iban
]

{ #category : #accessing }
ASDHMAbstractContact >> iban: anObject [

	Iban := anObject
]

{ #category : #initialization }
ASDHMAbstractContact >> initialize [

	super initialize. 
	self bankVerbindungen: OrderedCollection new
]

{ #category : #accessing }
ASDHMAbstractContact >> kontoInhaber [

	^ KontoInhaber
]

{ #category : #accessing }
ASDHMAbstractContact >> kontoInhaber: anObject [

	KontoInhaber := anObject
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
ASDHMAbstractContact >> ort [

	^ ort
]

{ #category : #accessing }
ASDHMAbstractContact >> ort: anObject [

	ort := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> plz [

	^ plz
]

{ #category : #accessing }
ASDHMAbstractContact >> plz: anObject [

	plz := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> str [

	^ str
]

{ #category : #accessing }
ASDHMAbstractContact >> str: anObject [

	str := anObject
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
