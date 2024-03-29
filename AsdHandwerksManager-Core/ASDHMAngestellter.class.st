Class {
	#name : #ASDHMAngestellter,
	#superclass : #ASDHMAbstractContact,
	#instVars : [
		'beruf',
		'gelernterBeruf',
		'lohnSteuerKlasse',
		'steuerId',
		'stundenLohn',
		'userAccount',
		'firmenId'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMAngestellter class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMAngestellter class >> titleText [
^'Angestellter'
]

{ #category : #accessing }
ASDHMAngestellter >> beruf [

	^ beruf
]

{ #category : #accessing }
ASDHMAngestellter >> beruf: anObject [

	beruf := anObject
]

{ #category : #accessing }
ASDHMAngestellter >> firmenId [

	^ firmenId
]

{ #category : #accessing }
ASDHMAngestellter >> firmenId: anObject [

	firmenId := anObject
]

{ #category : #accessing }
ASDHMAngestellter >> gelernterBeruf [

	^ gelernterBeruf
]

{ #category : #accessing }
ASDHMAngestellter >> gelernterBeruf: anObject [

	gelernterBeruf := anObject
]

{ #category : #initialization }
ASDHMAngestellter >> initialize [
	super initialize.
]

{ #category : #accessing }
ASDHMAngestellter >> lohnSteuerKlasse [

	^ lohnSteuerKlasse
]

{ #category : #accessing }
ASDHMAngestellter >> lohnSteuerKlasse: anObject [

	lohnSteuerKlasse := anObject
]

{ #category : #accessing }
ASDHMAngestellter >> steuerId [

	^ steuerId
]

{ #category : #accessing }
ASDHMAngestellter >> steuerId: anObject [

	steuerId := anObject
]

{ #category : #accessing }
ASDHMAngestellter >> stundenLohn [

	^ stundenLohn
]

{ #category : #accessing }
ASDHMAngestellter >> stundenLohn: anObject [

	stundenLohn := anObject
]

{ #category : #accessing }
ASDHMAngestellter >> userAccount [

	^ userAccount
]

{ #category : #accessing }
ASDHMAngestellter >> userAccount: anObject [

	userAccount := anObject
]
