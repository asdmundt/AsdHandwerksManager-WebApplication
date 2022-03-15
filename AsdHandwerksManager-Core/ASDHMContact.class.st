Class {
	#name : #ASDHMContact,
	#superclass : #ASDHMAbstractContact,
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMContact class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMContact class >> titleText [

	^ 'Kontakt'
]

{ #category : #accessing }
ASDHMContact >> displayString [

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: self displayName;
			  space;
			  nextPutAll: self telefonNummer;
			  space ]
]

{ #category : #initialization }
ASDHMContact >> initialize [

	super initialize.

	self type: 'contact'
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
