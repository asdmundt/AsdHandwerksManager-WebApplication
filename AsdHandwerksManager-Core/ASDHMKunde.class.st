Class {
	#name : #ASDHMKunde,
	#superclass : #ASDHMModel,
	#instVars : [
		'displayName',
		'gewerblich',
		'firma',
		'contact'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

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
	
	
	
]
