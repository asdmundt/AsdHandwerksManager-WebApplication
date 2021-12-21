Class {
	#name : #ASDHMPartnerFirma,
	#superclass : #ASDHMFirma,
	#instVars : [
		'stundensatz'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMPartnerFirma class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMPartnerFirma class >> titleText [

	^ 'Partner Firma'
]

{ #category : #accessing }
ASDHMPartnerFirma >> stundensatz [

	^ stundensatz
]

{ #category : #accessing }
ASDHMPartnerFirma >> stundensatz: anObject [

	stundensatz := anObject
]
