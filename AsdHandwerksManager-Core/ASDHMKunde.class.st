Class {
	#name : #ASDHMKunde,
	#superclass : #ASDHMModel,
	#instVars : [
		'displayName',
		'gewerblich',
		'firma',
		'contact',
		'auftraege'
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

{ #category : #actions }
ASDHMKunde >> addAuftrag: anAuftrag [

self auftraege add: anAuftrag
]

{ #category : #accessing }
ASDHMKunde >> auftraege [

	^ auftraege ifNil: [ auftraege := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMKunde >> auftraege: anObject [

	auftraege := anObject
]

{ #category : #accessing }
ASDHMKunde >> contact [

	^ contact
]

{ #category : #accessing }
ASDHMKunde >> contact: anObject [

	contact := anObject
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

{ #category : #accessing }
ASDHMKunde >> firma [

	^ firma
]

{ #category : #accessing }
ASDHMKunde >> firma: anObject [

	firma := anObject
]

{ #category : #accessing }
ASDHMKunde >> gewerblich [

	^ gewerblich
]

{ #category : #accessing }
ASDHMKunde >> gewerblich: anObject [

	gewerblich := anObject
]

{ #category : #initialization }
ASDHMKunde >> initialize [
	super initialize.
	
	self type: 'costumer'
	
]
