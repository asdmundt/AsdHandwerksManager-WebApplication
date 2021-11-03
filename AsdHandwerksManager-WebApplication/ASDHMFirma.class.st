Class {
	#name : #ASDHMFirma,
	#superclass : #ASDHMModel,
	#instVars : [
		'name',
		'adressen',
		'firmenForm'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMFirma class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMFirma >> addAdresse: anObject [

	adressen add: anObject
]

{ #category : #accessing }
ASDHMFirma >> adressen [
^ adressen ifNil: [ adressen := OrderedCollection new ]
	
]

{ #category : #accessing }
ASDHMFirma >> firmenForm [

	^ firmenForm
]

{ #category : #accessing }
ASDHMFirma >> firmenForm: anObject [

	firmenForm := anObject
]

{ #category : #initialization }
ASDHMFirma >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMFirma >> name [

	^ name
]

{ #category : #accessing }
ASDHMFirma >> name: anObject [

	name := anObject
]
