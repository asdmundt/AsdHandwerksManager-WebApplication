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
	#category : #'AsdHandwerksManager-Core-Db'
}

{ #category : #'class initialization' }
ASDHMDbModelBlz class >> current [
	^ uniqueInstanceDbModelBauManagerBlz ifNil: [ uniqueInstanceDbModelBauManagerBlz := self new ]
]

{ #category : #'default values' }
ASDHMDbModelBlz class >> defaultPwd [

	^ 'saino1972'
]

{ #category : #'default values' }
ASDHMDbModelBlz class >> defaultRepository [
	^ 'handwerkBlz'
]

{ #category : #'default values' }
ASDHMDbModelBlz class >> defaultUser [

	^ 'blz'
]

{ #category : #voyage }
ASDHMDbModelBlz class >> importBlz [

	| dataFile coll |
	dataFile := FileSystem disk workingDirectory / 'files' / 'blz.csv'.

	coll := OrderedCollection withAll:
		        (dataFile asFileReference readStreamDo: [ :input | 
			         (NeoCSVReader on: (ZnBufferedReadStream on: input))
				         skipHeader;
				         recordClass: ASDHMBankLeitzahlen;
				         addField: #blz:;
				         addField: #bankName:;
				         addField: #plz:;
				         addField: #ort:;
				         addField: #bankNameKurz:;
				         addField: #bic:;
				         addField: #pruefZiffer:;
				         upToEnd ]).
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
ASDHMDbModelBlz class >> initializeStratoHostMongoDB [

	Repos := VOMongoRepository
		         host: '81.169.136.23'
		         database: self defaultRepository
		         username: self defaultUser
		         password: self defaultPwd
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
	self initializeStratoHostMongoDB
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

{ #category : #operations }
ASDHMDbModelBlz >> storeObject: aObject [
	Repos save: aObject
]
