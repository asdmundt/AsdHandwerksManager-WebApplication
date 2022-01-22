Class {
	#name : #ASDHMPhoneContact,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'displayName'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMPhoneContact class >> displayName: aName email: aString telefonNummer: aNumber [

	^ self new
		  displayName: aName;
		email: aString;
		  telefonNummer: aNumber
]

{ #category : #'instance creation' }
ASDHMPhoneContact class >> displayName: aName telefonNummer: aNumber [

	^ self new
		  displayName: aName;
		  telefonNummer: aNumber
]

{ #category : #voyage }
ASDHMPhoneContact class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMPhoneContact class >> titleText [

	^ 'Telefon Kontakt'
]

{ #category : #accessing }
ASDHMPhoneContact class >> types [

	^ OrderedCollection newFrom:
		  { 'TelefonKontakt'. 'projektLeiter'. 'user'. 'costumer' }
]

{ #category : #accessing }
ASDHMPhoneContact >> displayName [

	^ displayName
]

{ #category : #accessing }
ASDHMPhoneContact >> displayName: anObject [

	displayName := anObject
]

{ #category : #accessing }
ASDHMPhoneContact >> displayString [

	^ String streamContents: [ :s | 
		  s
			  nextPutAll: self displayName;
			  space;
			  nextPutAll: self telefonNummer;
			  space ]
]

{ #category : #initialization }
ASDHMPhoneContact >> initialize [
	super initialize.
	
	self type: 'costumer'
	
]

{ #category : #accessing }
ASDHMPhoneContact >> type [

	^ type
]

{ #category : #accessing }
ASDHMPhoneContact >> type: anObject [

	type := anObject
]

{ #category : #accessing }
ASDHMPhoneContact >> types [

	^ types
]
