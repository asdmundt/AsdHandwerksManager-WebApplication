Class {
	#name : #ASDHMLeistungenObergruppe,
	#superclass : #ASDHMModel,
	#instVars : [
		'leistungsBeschreibung',
		'preis',
		'zeit',
		'kategorieKuerzel',
		'leistungen'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMLeistungenObergruppe class >> bez: aString andKategorieKuerzel: aThreeDigit [

	^ self new
		  bez: aString;
		  kategorieKuerzel: aThreeDigit;
		  yourself
]

{ #category : #voyage }
ASDHMLeistungenObergruppe class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMLeistungenObergruppe class >> kategorieKuerzel: aThreeDigit [

	^ self new
		  kategorieKuerzel: aThreeDigit;
		  yourself
]

{ #category : #accessing }
ASDHMLeistungenObergruppe class >> titleText [

	^ 'Leistungen'
]

{ #category : #accessing }
ASDHMLeistungenObergruppe >> leistungen [

	^ leistungen
]

{ #category : #accessing }
ASDHMLeistungenObergruppe >> leistungen: anObject [

	leistungen := anObject
]
