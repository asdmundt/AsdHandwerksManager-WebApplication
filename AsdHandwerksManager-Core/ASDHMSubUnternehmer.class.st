Class {
	#name : #ASDHMSubUnternehmer,
	#superclass : #ASDHMFirma,
	#instVars : [
		'stundensatz'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMSubUnternehmer class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMSubUnternehmer class >> titleText [
^'Subunternehmer'
]

{ #category : #accessing }
ASDHMSubUnternehmer >> stundensatz [

	^ stundensatz
]

{ #category : #accessing }
ASDHMSubUnternehmer >> stundensatz: anObject [

	stundensatz := anObject
]
