Class {
	#name : #ASDHMLeistungen,
	#superclass : #ASDHMModel,
	#instVars : [
		'leistungsBeschreibung',
		'einheit',
		'preis',
		'zeitProEinheit',
		'artikelKurzText',
		'artikelTitel',
		'artikelId',
		'kategorieKuerzel',
		'artikelBeschreibung',
		'artikelGroesse'
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
ASDHMLeistungen >> artikelBeschreibung [

	^ artikelBeschreibung
]

{ #category : #accessing }
ASDHMLeistungen >> artikelBeschreibung: anObject [

	artikelBeschreibung := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> artikelGroesse [

	^ artikelGroesse
]

{ #category : #accessing }
ASDHMLeistungen >> artikelGroesse: anObject [

	artikelGroesse := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> artikelId [

	^ artikelId
]

{ #category : #accessing }
ASDHMLeistungen >> artikelId: anObject [

	artikelId := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> artikelKurzText [

	^ artikelKurzText
]

{ #category : #accessing }
ASDHMLeistungen >> artikelKurzText: anObject [

	artikelKurzText := anObject
]

{ #category : #accessing }
ASDHMLeistungen >> artikelTitel [

	^ artikelTitel
]

{ #category : #accessing }
ASDHMLeistungen >> artikelTitel: anObject [

	artikelTitel := anObject
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
ASDHMLeistungen >> zeitProEinheit [

	^ zeitProEinheit
]

{ #category : #accessing }
ASDHMLeistungen >> zeitProEinheit: anObject [

	zeitProEinheit := anObject
]
