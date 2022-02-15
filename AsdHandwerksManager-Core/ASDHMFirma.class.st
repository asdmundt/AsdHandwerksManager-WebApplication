Class {
	#name : #ASDHMFirma,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'firmenName',
		'firmenForm',
		'firmenSitz',
		'amtsgerichtSitz',
		'hre',
		'steuerNr',
		'umsatzSteuer',
		'geschaeftsFuehrer',
		'ansprechPartner'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMFirma class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMFirma class >> titleText [
^'Firmen Kontakt'
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
ASDHMFirma >> ansprechPartner [

	^ ansprechPartner
]

{ #category : #accessing }
ASDHMFirma >> ansprechPartner: anObject [

	ansprechPartner := anObject
]

{ #category : #accessing }
ASDHMFirma >> displayString [

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: self firmenName;
			  space;
			  nextPutAll: self firmenForm;
			  space;
			 nextPutAll: self firmenSitz
			 ]
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
ASDHMFirma >> firmenName [

	^ firmenName
]

{ #category : #accessing }
ASDHMFirma >> firmenName: anObject [

	firmenName := anObject
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
