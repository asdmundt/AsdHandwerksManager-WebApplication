Class {
	#name : #ASDHMContact,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'displayName'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMContact class >> displayName: aName email: aString telefonNummer: aNumber [

	^ self new
		  displayName: aName;
		email: aString;
		  telefonNummer: aNumber
]

{ #category : #'instance creation' }
ASDHMContact class >> displayName: aName telefonNummer: aNumber [

	^ self new
		  displayName: aName;
		  telefonNummer: aNumber
]

{ #category : #voyage }
ASDHMContact class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMContact class >> titleText [

	^ 'Telefon Kontakt'
]

{ #category : #accessing }
ASDHMContact class >> types [

	^ OrderedCollection newFrom:
		  { 'TelefonKontakt'. 'projektLeiter'. 'user'. 'costumer' }
]

{ #category : #accessing }
ASDHMContact >> displayName [

	^ displayName
]

{ #category : #accessing }
ASDHMContact >> displayName: anObject [

	displayName := anObject
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
	
	self type: 'costumer'
	
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
