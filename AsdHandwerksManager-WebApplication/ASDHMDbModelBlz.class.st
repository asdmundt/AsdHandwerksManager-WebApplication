Class {
	#name : #ASDHMDbModelBlz,
	#superclass : #Object,
	#instVars : [
		'artikel'
	],
	#classVars : [
		'Repos'
	],
	#classInstVars : [
		'uniqueInstanceDbModelBauManagerBlz'
	],
	#category : #'AsdHandwerksManager-WebApplication-db'
}

{ #category : #'class initialization' }
ASDHMDbModelBlz class >> current [
	^ uniqueInstanceDbModelBauManagerBlz ifNil: [ uniqueInstanceDbModelBauManagerBlz := self new ]
]

{ #category : #'default values' }
ASDHMDbModelBlz class >> defaultRepository [
	^ 'handwerkBlz'
]

{ #category : #voyage }
ASDHMDbModelBlz class >> importBlz [
|dataFile coll|

"dataFile := FileLocator imageDirectory / 'files' / 'streha.csv' asFileReference ."

coll := OrderedCollection withAll: ( 'blz.csv' asFileReference readStreamDo: [ :input |
(NeoCSVReader on: (ZnBufferedReadStream on: input))
skipHeader;
recordClass: ASDHMBankLeitzahlen ;
addField: #blz:;
addField: #bankName:;
addField: #plz:;

addField: #bankNameKurz:;
addField: #bic:;
addField: #pruefZiffer:;
upToEnd 
 ]) .
^ coll
"coll do: [ :each | Transcript show: each ]"

]

{ #category : #'class initialization' }
ASDHMDbModelBlz class >> initialize [
	self reset
]

{ #category : #voyage }
ASDHMDbModelBlz class >> initializeLocalhostMongoDB [
	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDHMDbModelBlz class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDHMDbModelBlz class >> reset [
	uniqueInstanceDbModelBauManagerBlz := nil.
	"VORepository current reset."
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDHMDbModelBlz class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDHMDbModelBlz >> categorieCollection [
	| categorieColl |
	categorieColl := OrderedCollection new.
	self  shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #initialization }
ASDHMDbModelBlz >> initialize [
	super initialize.
	artikel  := OrderedCollection new
]

{ #category : #accessing }
ASDHMDbModelBlz >> loggedUsers [
	^Repos selectMany: ASDEUser where: [ :each | each logged = true ]
]

{ #category : #operations }
ASDHMDbModelBlz >> storeObject: aObject [
	Repos save: aObject
]
