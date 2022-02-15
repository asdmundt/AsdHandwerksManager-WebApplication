Class {
	#name : #ASDHMDbModelBase,
	#superclass : #Object,
	#instVars : [
		'users',
		'loggedUsers'
	],
	#classVars : [
		'Repos'
	],
	#classInstVars : [
		'uniqueInstanceDbModelBauManagerBase'
	],
	#category : #'AsdHandwerksManager-Core-Db'
}

{ #category : #voyage }
ASDHMDbModelBase class >> createAdmin [

	Repos save:
		(ASDHMUser benutzerName: 'admin' password: 'pwd' admin: true)
]

{ #category : #'data sample' }
ASDHMDbModelBase class >> createDemoData [
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

{ #category : #voyage }
ASDHMDbModelBase class >> createUser [

	Repos save:
		(ASDHMUser benutzerName: 'test' password: 'test' admin: false)
]

{ #category : #'class initialization' }
ASDHMDbModelBase class >> current [
	^ uniqueInstanceDbModelBauManagerBase ifNil: [ uniqueInstanceDbModelBauManagerBase := self new ]
]

{ #category : #'default values' }
ASDHMDbModelBase class >> defaultRepository [
	^ 'handwerkBase'
]

{ #category : #'data sample' }
ASDHMDbModelBase class >> importContacts [

	| dataFile coll |
	"dataFile := FileLocator imageDirectory / 'files' / 'streha.csv' asFileReference ."
	coll := OrderedCollection withAll:
		        ('contacts.csv' asFileReference readStreamDo: [ :input | 
			         (NeoCSVReader on: (ZnBufferedReadStream on: input))
				         skipHeader;
				         recordClass: ASDHMContact;
				         addField: #displayName:;
				addField: #email:;
				         addField: #telefonNummer:;
				         upToEnd ]).
	coll inspect.
	^ coll
]

{ #category : #'class initialization' }
ASDHMDbModelBase class >> initialize [
	self reset
]

{ #category : #voyage }
ASDHMDbModelBase class >> initializeLocalhostMongoDB [
	Repos := VOMongoRepository database: self defaultRepository
]

{ #category : #voyage }
ASDHMDbModelBase class >> isVoyageRoot [
   "Indicates that instances of this class are top level documents
    in noSQL databases"
   ^ true
]

{ #category : #'class initialization' }
ASDHMDbModelBase class >> reset [
	uniqueInstanceDbModelBauManagerBase := nil.
	"VORepository current reset."
	VORepository repositoryContainer: VODynamicContainer new.
	self initializeLocalhostMongoDB
]

{ #category : #'default values' }
ASDHMDbModelBase class >> version [
^'1.0.0'
]

{ #category : #operations }
ASDHMDbModelBase >> addLoggedUser: aUser [
	aUser logged: true.
	"Repos save: aUser "
]

{ #category : #operations }
ASDHMDbModelBase >> artCategories [
	^ Repos
		selectMany: ASDHMKategorie
		where: [ :each | each type = 'artikelArtKategorie' ]
]

{ #category : #operations }
ASDHMDbModelBase >> artikelCategories [
	^ Repos
		selectMany: ASDEKategorie
		where: [ :each | each type = 'artikelKategorie' ]
]

{ #category : #operations }
ASDHMDbModelBase >> categorieCollection [
	| categorieColl |
	categorieColl := OrderedCollection new.
	self  shopCategories
		do: [ :aCat | categorieColl add: aCat name ].
	^ categorieColl
]

{ #category : #accessing }
ASDHMDbModelBase >> contacts [

	| collection |
	collection := Repos selectAll: ASDHMContact.
	^ collection yourself
]

{ #category : #accessing }
ASDHMDbModelBase >> costumers [

	| collection |
	collection := Repos selectAll: ASDHMKunde.
	^ collection yourself
]

{ #category : #operations }
ASDHMDbModelBase >> eigeneFirma [
	^ Repos 
		selectAll: ASDHMEigeneFirma
		
]

{ #category : #accessing }
ASDHMDbModelBase >> firmen [
	| collection |
	collection := Repos selectAll: ASDHMFirma.
	^ collection yourself
]

{ #category : #initialization }
ASDHMDbModelBase >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #operations }
ASDHMDbModelBase >> installConfig [

	^ Repos selectAll: ASDHMInstallConfig 
]

{ #category : #accessing }
ASDHMDbModelBase >> loggedUsers [

	^ Repos selectMany: ASDEUser where: [ :each | each logged == true ]
]

{ #category : #accessing }
ASDHMDbModelBase >> loggedUsers: anObject [
	loggedUsers := anObject
]

{ #category : #operations }
ASDHMDbModelBase >> oberCategories [
	^ Repos
		selectMany: ASDEKategorie
		where: [ :each | each type = 'artikelOberKategorie' ]
]

{ #category : #accessing }
ASDHMDbModelBase >> phoneContacts [

	| collection |
	collection := Repos selectAll: ASDHMPhoneContact .
	^ collection yourself
]

{ #category : #operations }
ASDHMDbModelBase >> storeObject: aObject [
	Repos save: aObject
]

{ #category : #operations }
ASDHMDbModelBase >> userFromLogin: aLogin andPassword: aPassword [
	^ Repos 
		selectOne: ASDHMUser
		where: [ :each | each benutzerName = aLogin & (each password = aPassword) ]
]

{ #category : #accessing }
ASDHMDbModelBase >> users [
| collection |
	collection := Repos selectAll: ASDHMUser.
	^ collection yourself
]
