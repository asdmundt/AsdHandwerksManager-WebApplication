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
	#category : #'AsdHandwerksManager-WebApplication-Utils'
}

{ #category : #'class initialization' }
ASDHMDbModelMalerGewerg class >> current [
	^ uniqueInstanceDbModelBauManagerDataNorm ifNil: [ uniqueInstanceDbModelBauManagerDataNorm := self new ]
]

{ #category : #'default values' }
ASDHMDbModelMalerGewerg class >> defaultRepository [
	^ 'handwerkMalerGewerg'
]

{ #category : #'data sample' }
ASDHMDbModelMalerGewerg class >> importArtikel [
|dataFile coll|

"dataFile := FileLocator imageDirectory / 'files' / 'streha.csv' asFileReference ."

coll := OrderedCollection withAll: ( 'arbeiten.csv' asFileReference readStreamDo: [ :input |
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
ASDHMDbModelMalerGewerg class >> initialize [
	self reset
]

{ #category : #voyage }
ASDHMDbModelMalerGewerg class >> initializeLocalhostMongoDB [
	Repos := VOMongoRepository database: self defaultRepository
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
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDHMDbModelMalerGewerg class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> categorieCollection [
	| categorieColl |
	categorieColl := OrderedCollection new.
	self  shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #initialization }
ASDHMDbModelMalerGewerg >> initialize [
	super initialize.
	artikel  := OrderedCollection new
]

{ #category : #accessing }
ASDHMDbModelMalerGewerg >> loggedUsers [
	^Repos selectMany: ASDEUser where: [ :each | each logged = true ]
]

{ #category : #operations }
ASDHMDbModelMalerGewerg >> storeObject: aObject [
	Repos save: aObject
]
