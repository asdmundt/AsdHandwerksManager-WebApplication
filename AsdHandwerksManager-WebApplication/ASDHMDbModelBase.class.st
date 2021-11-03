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
	#category : #'AsdHandwerksManager-WebApplication-Utils'
}

{ #category : #voyage }
ASDHMDbModelBase class >> createAdmin [
	Repos save: (ASDEUser benutzerName: 'admin' password: 'pwd' admin: true) 
]

{ #category : #'data sample' }
ASDHMDbModelBase class >> createDataBauDekoration [
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

{ #category : #'class initialization' }
ASDHMDbModelBase class >> current [
	^ uniqueInstanceDbModelBauManagerBase ifNil: [ uniqueInstanceDbModelBauManagerBase := self new ]
]

{ #category : #'default values' }
ASDHMDbModelBase class >> defaultRepository [
	^ 'handwerk_asdmundt'
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

{ #category : #initialization }
ASDHMDbModelBase >> initialize [
	super initialize.
	users := OrderedCollection new
]

{ #category : #accessing }
ASDHMDbModelBase >> loggedUsers [
	^Repos selectMany: ASDEUser where: [ :each | each logged = true ]
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

{ #category : #operations }
ASDHMDbModelBase >> storeObject: aObject [
	Repos save: aObject
]

{ #category : #operations }
ASDHMDbModelBase >> storeUser: aUser [
	aUser save.
]

{ #category : #operations }
ASDHMDbModelBase >> userFromLogin: aLogin andPassword: aPassword [
	^ Repos 
		selectOne: ASDHMUser
		where: [ :each | each benutzerName = aLogin & (each password = aPassword) ]
]

{ #category : #accessing }
ASDHMDbModelBase >> users [
	^ Repos selectAll: ASDHMUser 
]