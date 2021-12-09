Class {
	#name : #ASDHMContact,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'anrede',
		'vorname',
		'nachname',
		'title'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMContact class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMContact class >> titleText [
^'Kontakt'
]

{ #category : #accessing }
ASDHMContact class >> types [ 
^ OrderedCollection
		newFrom: {'admin' . 'projektLeiter' . 'user' . 'costumer'}.
]

{ #category : #accessing }
ASDHMContact >> anrede [

	^ anrede
]

{ #category : #accessing }
ASDHMContact >> anrede: anObject [

	anrede := anObject
]

{ #category : #accessing }
ASDHMContact >> email [

	^ email
]

{ #category : #accessing }
ASDHMContact >> email: anObject [

	email := anObject
]

{ #category : #initialization }
ASDHMContact >> initialize [
	super initialize.
	
	self type: 'costumer'
	
]

{ #category : #accessing }
ASDHMContact >> nachname [

	^ nachname
]

{ #category : #accessing }
ASDHMContact >> nachname: anObject [

	nachname := anObject
]

{ #category : #accessing }
ASDHMContact >> title [

	^ title
]

{ #category : #accessing }
ASDHMContact >> title: anObject [

	title := anObject
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

{ #category : #accessing }
ASDHMContact >> vorname [

	^ vorname
]

{ #category : #accessing }
ASDHMContact >> vorname: anObject [

	vorname := anObject
]
