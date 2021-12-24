Class {
	#name : #ASDHMSubUnternehmer,
	#superclass : #ASDHMFirma,
	#instVars : [
		'stundensatz'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

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