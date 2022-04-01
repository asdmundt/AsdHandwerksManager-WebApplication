Class {
	#name : #ASDHMContact,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'gewerblich'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMContact class >> gewerblicherKontakt: aBoolean [

	^ self new
		  gewerblich: aBoolean;
		  yourself
]

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

	self gewerblich
		ifTrue: [ 
			^ String streamContents: [ :s | 
				  s
					  nextPutAll: self firmenName;
					  space;
					  nextPutAll: self ansprechPartner;
					  space ] ]
		ifFalse: [ ^ String streamContents: [ :s | 
		  s
			  nextPutAll: self anrede;
			  space;
			  nextPutAll: self title;
			  space;
			  nextPutAll: self vorname;
			  space;
			  nextPutAll: self nachname;
			  space ] ]
]

{ #category : #accessing }
ASDHMContact >> gewerblich [

	^ gewerblich
]

{ #category : #accessing }
ASDHMContact >> gewerblich: anObject [

	gewerblich := anObject
]

{ #category : #initialization }
ASDHMContact >> initialize [

	super initialize.
	self gewerblich: false.
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
