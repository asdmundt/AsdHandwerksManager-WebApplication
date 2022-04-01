Class {
	#name : #ASDHMArtikel,
	#superclass : #ASDHMModel,
	#instVars : [
		'name',
		'titel',
		'descr',
		'artikelNr',
		'herstellerId',
		'lieferant',
		'descrUrl',
		'ekPreis',
		'vkPreis',
		'artKategorie',
		'oberKategorie',
		'kategorie',
		'KatId',
		'bild',
		'tags',
		'einheit',
		'EanNr',
		'warenGruppe',
		'warenGruppeId'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMArtikel class >> artikelNr: anArtikel titel: aTitel name: aName ekPreis: aPreis einheit: aUnit warenGruppe: anArtikelGroup warenGruppeId: anArtikelGroupId lieferant: aSupplier eanNr: aNumber [

	^ self new
		  artikelNr: anArtikel;
		  titel: aTitel;
		  name: aName;
		  ekPreis: aPreis;
		  einheit: aUnit;
		  warenGruppe: anArtikelGroup;
		  warenGruppeId: anArtikelGroupId;
		  lieferant: aSupplier;
		  eanNr: aNumber;
		 yourself
]

{ #category : #voyage }
ASDHMArtikel class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMArtikel class >> shopId: anInt [
	^ self new
		shopId: anInt;
		yourself
]

{ #category : #actions }
ASDHMArtikel >> addTag: aTag [
tags add: aTag 
	
]

{ #category : #accessing }
ASDHMArtikel >> artKategorie [
	^ artKategorie
]

{ #category : #accessing }
ASDHMArtikel >> artKategorie: anObject [
	artKategorie := anObject
]

{ #category : #accessing }
ASDHMArtikel >> artikelNr [
	^ artikelNr
]

{ #category : #accessing }
ASDHMArtikel >> artikelNr: anObject [
	artikelNr := anObject
]

{ #category : #accessing }
ASDHMArtikel >> bild [
	^ bild
]

{ #category : #accessing }
ASDHMArtikel >> bild: anObject [
	bild := anObject
]

{ #category : #accessing }
ASDHMArtikel >> descr [
	^ descr
]

{ #category : #accessing }
ASDHMArtikel >> descr: anObject [
	descr := anObject
]

{ #category : #accessing }
ASDHMArtikel >> descrUrl [
	^ descrUrl
]

{ #category : #accessing }
ASDHMArtikel >> descrUrl: anObject [
	descrUrl := anObject
]

{ #category : #accessing }
ASDHMArtikel >> eanNr [

	^ EanNr
]

{ #category : #accessing }
ASDHMArtikel >> eanNr: anObject [

	EanNr := anObject
]

{ #category : #accessing }
ASDHMArtikel >> einheit [

	^ einheit
]

{ #category : #accessing }
ASDHMArtikel >> einheit: anObject [

	einheit := anObject
]

{ #category : #accessing }
ASDHMArtikel >> ekPreis [
	^ ekPreis
]

{ #category : #accessing }
ASDHMArtikel >> ekPreis: anObject [
	ekPreis := anObject
]

{ #category : #accessing }
ASDHMArtikel >> herstellerId [

	^ herstellerId
]

{ #category : #accessing }
ASDHMArtikel >> herstellerId: anObject [

	herstellerId := anObject
]

{ #category : #initialization }
ASDHMArtikel >> initialize [
	super initialize.
	self tags: OrderedCollection new.
]

{ #category : #accessing }
ASDHMArtikel >> katId [

	^ KatId
]

{ #category : #accessing }
ASDHMArtikel >> katId: anObject [

	KatId := anObject
]

{ #category : #accessing }
ASDHMArtikel >> kategorie [
	^ kategorie
]

{ #category : #accessing }
ASDHMArtikel >> kategorie: anObject [
	kategorie := anObject
]

{ #category : #accessing }
ASDHMArtikel >> lieferant [
	^ lieferant
]

{ #category : #accessing }
ASDHMArtikel >> lieferant: anObject [
	lieferant := anObject
]

{ #category : #accessing }
ASDHMArtikel >> name [
	^ name
]

{ #category : #accessing }
ASDHMArtikel >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASDHMArtikel >> oberKategorie [
	^ oberKategorie
]

{ #category : #accessing }
ASDHMArtikel >> oberKategorie: anObject [
	oberKategorie := anObject
]

{ #category : #accessing }
ASDHMArtikel >> tags [
	^ tags
]

{ #category : #accessing }
ASDHMArtikel >> tags: anObject [
	tags := anObject
]

{ #category : #accessing }
ASDHMArtikel >> titel [
	^ titel
]

{ #category : #accessing }
ASDHMArtikel >> titel: anObject [
	titel := anObject
]

{ #category : #accessing }
ASDHMArtikel >> vkPreis [
	^ vkPreis
]

{ #category : #accessing }
ASDHMArtikel >> vkPreis: anObject [
	vkPreis := anObject
]

{ #category : #accessing }
ASDHMArtikel >> warenGruppe [

	^ warenGruppe
]

{ #category : #accessing }
ASDHMArtikel >> warenGruppe: anObject [

	warenGruppe := anObject
]

{ #category : #accessing }
ASDHMArtikel >> warenGruppeId [

	^ warenGruppeId
]

{ #category : #accessing }
ASDHMArtikel >> warenGruppeId: anObject [

	warenGruppeId := anObject
]
