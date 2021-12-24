Class {
	#name : #ASDHMKunde,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'displayName'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMKunde class >> displayName: aName telefonNummer: aNumber [

	^ self new
		  displayName: aName;
		  telefonNummer: aNumber
]

{ #category : #voyage }
ASDHMKunde class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMKunde class >> titleText [

	^ 'Telefon Kontakt'
]

{ #category : #accessing }
ASDHMKunde class >> types [

	^ OrderedCollection newFrom:
		  { 'TelefonKontakt'. 'projektLeiter'. 'user'. 'costumer' }
]

{ #category : #accessing }
ASDHMKunde >> displayName [

	^ displayName
]

{ #category : #accessing }
ASDHMKunde >> displayName: anObject [

	displayName := anObject
]

{ #category : #accessing }
ASDHMKunde >> displayString [

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: self displayName;
			  space;
			  nextPutAll: self telefonNummer;
			  space ]
]

{ #category : #initialization }
ASDHMKunde >> initialize [
	super initialize.
	
	self type: 'costumer'
	
]

{ #category : #accessing }
ASDHMKunde >> type [

	^ type
]

{ #category : #accessing }
ASDHMKunde >> type: anObject [

	type := anObject
]

{ #category : #accessing }
ASDHMKunde >> types [

	^ types
]
