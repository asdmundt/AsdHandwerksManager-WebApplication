Class {
	#name : #ASDHMDbModelMalerGewerg,
	#superclass : #Object,
	#instVars : [
		'artikel'
	],
	#classVars : [
		'Repos'
	],
	#classInstVars : [
		'uniqueInstanceDbModelBauManagerDataNorm'
	],
	#category : #'AsdHandwerksManager-Core-Db'
}

{ #category : #'data sample' }
ASDHMDbModelMalerGewerg class >> createDataBauDekoration [
	"(ASDEUser benutzerName: 'shop' password: 'xyz' admin: false)
		asShopOwner save."
Repos save: (ASDEKategorie name: 'Portal' andType: 'shop').
	Repos save: (ASDEKategorie name: 'Elektronik' andType: 'shop').
	Repos save: (ASDEKategorie name: 'Baumarkt' andType: 'shop').
	Repos save: (ASDEKategorie name: 'Textilien' andType: 'shop').
	Repos save: (ASDEKategorie name: 'SecondHand' andType: 'shop').
	Repos save: (ASDEKategorie name: 'Moebel' andType: 'shop').
	Repos save: (ASDEKategorie name: 'Werkzeug' andType: 'shop').
	Repos
		save: (ASDEKategorie name: 'Multimedia' andType: 'artikelArtKategorie').
	Repos
		save: (ASDEKategorie name: 'Computer' andType: 'artikelArtKategorie').
	Repos
		save:
			(ASDEKategorie
				name: 'ComputerKomponenten'
				andType: 'artikelArtKategorie').
	Repos
		save: (ASDEKategorie name: 'Lampen' andType: 'artikelArtKategorie').
	Repos
		save: (ASDEKategorie name: 'Moebel' andType: 'artikelArtKategorie').
	Repos
		save:
			(ASDEKategorie
				name: 'ElektronikKomponenten'
				andType: 'artikelArtKategorie').
	Repos
		save: (ASDEKategorie name: 'Boxen' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'Reciever' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'Mp3Player' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'TV' andType: 'artikelOberKategorie').
	Repos
		save: (ASDEKategorie name: 'Satelit' andType: 'artikelOberKategorie').
	Repos
		save:
			(ASDEKategorie
				name: 'ElektronikKomponenten'
				andType: 'artikelOberKategorie')
]

{ #category : #'class initialization' }
ASDHMDbModelMalerGewerg class >> current [
	^ uniqueInstanceDbModelBauManagerDataNorm ifNil: [ uniqueInstanceDbModelBauManagerDataNorm := self new ]
]

{ #category : #'default values' }
ASDHMDbModelMalerGewerg class >> defaultPwd [

	^ 'saino1972'
]

{ #category : #'default values' }
ASDHMDbModelMalerGewerg class >> defaultRepository [
	^ 'handwerkMalerGewerg'
]

{ #category : #'default values' }
ASDHMDbModelMalerGewerg class >> defaultUser [

	^ 'maler'
]

{ #category : #'data sample' }
ASDHMDbModelMalerGewerg class >> importArtikel [

	| dataFile coll |
	"dataFile := FileLocator imageDirectory / 'files' / 'streha.csv' asFileReference ."
	dataFile := FileSystem disk workingDirectory / 'files'
	            / 'artikel.csv'.
	coll := OrderedCollection withAll:
		        (dataFile asFileReference readStreamDo: [ :input | 
			         (NeoCSVReader on: (ZnBufferedReadStream on: input))
				         skipHeader;
				         recordClass: ASDHMArtikel;
				         addField: #artikelNr:;
				         addField: #titel:;
				         addField: #name:;
				         addField: #ekPreis:;
				         addField: #einheit:;
				         addField: #warenGruppeId:;
				         addField: #warenGruppe:;
				         addField: #lieferant:;
				         addField: #eanNr:;
				         upToEnd ]).
	
	^ coll
]

{ #category : #'class initialization' }
ASDHMDbModelMalerGewerg class >> initialize [
	self reset
]

{ #category : #voyage }
ASDHMDbModelMalerGewerg class >> initializeLocalhostMongoDB [

	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDHMDbModelMalerGewerg class >> initializeStratoHostMongoDB [

	Repos := VOMongoRepository
		         host: '81.169.136.23'
		         database: self defaultRepository
		         username: self defaultUser
		         password: self defaultPwd
]

{ #category : #voyage }
ASDHMDbModelMalerGewerg class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDHMDbModelMalerGewerg class >> reset [

	uniqueInstanceDbModelBauManagerDataNorm := nil.
	"VORepository current reset."
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeStratoHostMongoDB
]

{ #category : #'default values' }
ASDHMDbModelMalerGewerg class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> alleArtikel [

	| collection |
	collection := Repos selectAll: ASDHMArtikel.
	^ collection yourself
]

{ #category : #accessing }
ASDHMDbModelMalerGewerg >> artikel [

	^  self class importArtikel 
]

{ #category : #accessing }
ASDHMDbModelMalerGewerg >> artikel: anObject [

	artikel := anObject
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> artikelLikeName: aString [

	| collection patt |
	patt := '/^' , aString , '$/i'.
	collection := Repos
		              selectMany: ASDHMArtikel
		              where: [ :each | each kategorieKuerzel = aString ].
	^ collection yourself
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> artikelName: aString [

	| collection |
	collection := Repos selectAll: ASDHMArtikel.
	^ collection select: [ :each | aString match: each name ]
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> artikelWarengruppe: aString [

	| allCollection collection |
	collection := OrderedCollection new.
	allCollection := self artikel.
	collection := allCollection select: [ :each | 
		              aString match: each warenGruppe ].
	^ collection yourself
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> artikelWarengruppeGroup [

	| model data collWarengruppe |
	collWarengruppe := OrderedCollection.
	model := self artikel.
	data := model groupedBy: [ :each | each warenGruppe ].
	data keysDo: [ :each | collWarengruppe add: each ].
	^ collWarengruppe
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> artikelsFromWarengruppe: aGroup [

	| collection |
	collection := Repos
		              selectMany: ASDHMArtikel
		              where: [ :each | each warenGruppe = aGroup ].
	^ collection yourself
]

{ #category : #initialization }
ASDHMDbModelMalerGewerg >> initialize [
	super initialize.
	artikel  := OrderedCollection new
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> storeObject: aObject [
	Repos save: aObject
]
