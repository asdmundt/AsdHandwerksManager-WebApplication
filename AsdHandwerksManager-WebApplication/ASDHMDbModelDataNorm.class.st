Class {
	#name : #ASDHMDbModelDataNorm,
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
	#category : #'AsdHandwerksManager-WebApplication-Utils'
}

{ #category : #'data sample' }
ASDHMDbModelDataNorm class >> createDataBauDekoration [
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
ASDHMDbModelDataNorm class >> current [
	^ uniqueInstanceDbModelBauManagerDataNorm ifNil: [ uniqueInstanceDbModelBauManagerDataNorm := self new ]
]

{ #category : #'default values' }
ASDHMDbModelDataNorm class >> defaultRepository [
	^ 'handwerkDataNorm'
]

{ #category : #'data sample' }
ASDHMDbModelDataNorm class >> importDataNorm [
|dataFile coll|

"dataFile := FileLocator imageDirectory / 'files' / 'streha.csv' asFileReference ."

coll := OrderedCollection withAll: ( 'streha.csv' asFileReference readStreamDo: [ :input |
(NeoCSVReader on: (ZnBufferedReadStream on: input))
skipHeader;
recordClass: ASDHMArtikel ;
addField: #artikelNr:;
addField: #titel:;
addField: #name:;
addField: #ekPreis:;
addField: #einheit:;
addField: #warenGruppeId:;
addField: #warenGruppe:;
addField: #lieferant:;
addField: #eanNr:;

upToEnd 
 ]) .
coll inspect.
^coll

]

{ #category : #'class initialization' }
ASDHMDbModelDataNorm class >> initialize [
	self reset
]

{ #category : #voyage }
ASDHMDbModelDataNorm class >> initializeLocalhostMongoDB [
	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDHMDbModelDataNorm class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDHMDbModelDataNorm class >> reset [
	uniqueInstanceDbModelBauManagerDataNorm := nil.
	"VORepository current reset."
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDHMDbModelDataNorm class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDHMDbModelDataNorm >> categorieCollection [
	| categorieColl |
	categorieColl := OrderedCollection new.
	self  shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #initialization }
ASDHMDbModelDataNorm >> initialize [
	super initialize.
	artikel  := OrderedCollection new
]

{ #category : #accessing }
ASDHMDbModelDataNorm >> loggedUsers [
	^Repos selectMany: ASDEUser where: [ :each | each logged = true ]
]

{ #category : #operations }
ASDHMDbModelDataNorm >> storeObject: aObject [
	Repos save: aObject
]
