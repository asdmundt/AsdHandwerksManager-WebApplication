Class {
	#name : #ASDHMAbstractContact,
	#superclass : #ASDHMModel,
	#instVars : [
		'adressen',
		'mobilFunkNr',
		'telefonNummer',
		'email',
		'type',
		'types',
		'bankVerbindungen'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #testing }
ASDHMAbstractContact class >> isAbstract [
	^ self = ASDHMAbstractContact
]

{ #category : #accessing }
ASDHMAbstractContact class >> titleText [
^''
]

{ #category : #accessing }
ASDHMAbstractContact >> addAdresse: anObject [

	adressen add: anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> addBankVerbindungen: anObject [

	bankVerbindungen add: anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> adressen [
^ adressen ifNil: [ adressen := OrderedCollection new ]
	
]

{ #category : #accessing }
ASDHMAbstractContact >> adressen: anObject [

	adressen := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> bankVerbindungen [
^ bankVerbindungen ifNil: [ bankVerbindungen := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMAbstractContact >> bankVerbindungen: anObject [

	bankVerbindungen := anObject
]

{ #category : #initialization }
ASDHMAbstractContact >> initialize [
	super initialize.
	self adressen: OrderedCollection new.
	self bankVerbindungen: OrderedCollection new.
	
	
]

{ #category : #accessing }
ASDHMAbstractContact >> mobilFunkNr [

	^ mobilFunkNr
]

{ #category : #accessing }
ASDHMAbstractContact >> mobilFunkNr: anObject [

	mobilFunkNr := anObject
]

{ #category : #accessing }
ASDHMAbstractContact >> telefonNummer [

	^ telefonNummer
]

{ #category : #accessing }
ASDHMAbstractContact >> telefonNummer: anObject [

	telefonNummer := anObject
]
