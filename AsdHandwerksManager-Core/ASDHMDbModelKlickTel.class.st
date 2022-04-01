Class {
	#name : #ASDHMDbModelKlickTel,
	#superclass : #Object,
	#instVars : [
		'artikel'
	],
	#classVars : [
		'Repos'
	],
	#classInstVars : [
		'uniqueInstanceDbModelBauManagerklicktel'
	],
	#category : #'AsdHandwerksManager-Core-Db'
}

{ #category : #'class initialization' }
ASDHMDbModelKlickTel class >> current [

	^ uniqueInstanceDbModelBauManagerklicktel ifNil: [ 
		  uniqueInstanceDbModelBauManagerklicktel := self new ]
]

{ #category : #'default values' }
ASDHMDbModelKlickTel class >> defaultPwd [

	^ 'saino1972'
]

{ #category : #'default values' }
ASDHMDbModelKlickTel class >> defaultRepository [

	^ 'klickTel'
]

{ #category : #'default values' }
ASDHMDbModelKlickTel class >> defaultUser [

	^ 'asdAdmin'
]

{ #category : #voyage }
ASDHMDbModelKlickTel class >> importBlz [
|dataFile coll|

"dataFile := FileLocator imageDirectory / 'files' / 'streha.csv' asFileReference ."

coll := OrderedCollection withAll: ( 'blz.csv' asFileReference readStreamDo: [ :input |
(NeoCSVReader on: (ZnBufferedReadStream on: input))
skipHeader;
recordClass: ASDHMBankLeitzahlen ;
addField: #blz:;
addField: #bankName:;
addField: #plz:;
addField: #ort:;
addField: #bankNameKurz:;
addField: #bic:;
addField: #pruefZiffer:;
upToEnd 
 ]) .
^ coll
"coll do: [ :each | Transcript show: each ]"

]

{ #category : #'class initialization' }
ASDHMDbModelKlickTel class >> initialize [
	self reset
]

{ #category : #voyage }
ASDHMDbModelKlickTel class >> initializeLocalhostMongoDB [

	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDHMDbModelKlickTel class >> initializeStratoHostMongoDB [

	Repos := VOMongoRepository
		         host: '81.169.136.23'
		         database: self defaultRepository
		         username: self defaultUser
		         password: self defaultPwd
]

{ #category : #voyage }
ASDHMDbModelKlickTel class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDHMDbModelKlickTel class >> reset [

	uniqueInstanceDbModelBauManagerklicktel := nil.
	"VORepository current reset."
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDHMDbModelKlickTel class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDHMDbModelKlickTel >> categorieCollection [
	| categorieColl |
	categorieColl := OrderedCollection new.
	self  shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #operations }
ASDHMDbModelKlickTel >> contactsKlickTel [

	| collection |
	collection := Repos selectAll: ASDHMKlickTelKontakte.
	^ collection yourself
]

{ #category : #initialization }
ASDHMDbModelKlickTel >> initialize [
	super initialize.
	artikel  := OrderedCollection new
]

{ #category : #operations }
ASDHMDbModelKlickTel >> listsKlickTel [

	| collection |
	collection := Repos selectAll: ASDHMKlickTelListe.
	^ collection yourself
]

{ #category : #operations }
ASDHMDbModelKlickTel >> storeObject: aObject [
	Repos save: aObject
]
