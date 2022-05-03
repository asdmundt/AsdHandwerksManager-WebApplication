Class {
	#name : #ASDHMLeistungen,
	#superclass : #ASDHMModel,
	#instVars : [
		'leistungsBeschreibung',
		'einheit',
		'preis',
		'zeit',
		'artikelListe',
		'kategorieKuerzel'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMLeistungen class >> bez: aString andKategorieKuerzel: aThreeDigit [

	^ self new
		  bez: aString;
		  kategorieKuerzel: aThreeDigit;
		  yourself
]

{ #category : #voyage }
ASDHMLeistungen class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMLeistungen class >> kategorieKuerzel: aThreeDigit [

	^ self new
		  kategorieKuerzel: aThreeDigit;
		  yourself
]

{ #category : #accessing }
ASDHMLeistungen class >> titleText [

	^ 'Leistungen'
]

{ #category : #accessing }
ASDHMLeistungen >> artikelListe [

	^ artikelListe
]

{ #category : #accessing }
ASDHMLeistungen >> artikelListe: anObject [

	artikelListe := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> einheit [

	^ einheit
]

{ #category : #accessing }
ASDHMLeistungen >> einheit: anObject [

	einheit := anObject
]

{ #category : #initialization }
ASDHMLeistungen >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMLeistungen >> kategorieKuerzel [

	^ kategorieKuerzel
]

{ #category : #accessing }
ASDHMLeistungen >> kategorieKuerzel: anObject [

	kategorieKuerzel := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> leistungsBeschreibung [

	^ leistungsBeschreibung
]

{ #category : #accessing }
ASDHMLeistungen >> leistungsBeschreibung: anObject [

	leistungsBeschreibung := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> preis [

	^ preis
]

{ #category : #accessing }
ASDHMLeistungen >> preis: anObject [

	preis := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> zeit [

	^ zeit
]

{ #category : #accessing }
ASDHMLeistungen >> zeit: anObject [

	zeit := anObject
]
