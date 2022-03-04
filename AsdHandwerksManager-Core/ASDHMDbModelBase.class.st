Class {
	#name : #ASDHMDbModelBase,
	#superclass : #Object,
	#instVars : [
		'users'
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
ASDHMDbModelBase class >> createDataMalerKategorieBaum [
| ebeneEins ebeneEinsInnen ebeneEinsHolz ebeneEinsMetall ebeneEinsKunststoff ebeneEinsBeton ebeneEinsBrandSchutz ebeneEinsRegiearbeiten |
ebeneEins := ASDHMErsteEbeneKategorie bez: 'Fasade' andKuerzel: 'F'.
ebeneEinsInnen := ASDHMErsteEbeneKategorie bez: 'Innenraum' andKuerzel: 'I'.
ebeneEinsHolz := ASDHMErsteEbeneKategorie bez: 'Holz' andKuerzel: 'H'.
ebeneEinsMetall := ASDHMErsteEbeneKategorie bez: 'Metall' andKuerzel: 'M'.
ebeneEinsKunststoff := ASDHMErsteEbeneKategorie bez: 'Kunststoff' andKuerzel: 'K'.
ebeneEinsBeton := ASDHMErsteEbeneKategorie bez: 'Beton' andKuerzel: 'B'.
ebeneEinsBrandSchutz := ASDHMErsteEbeneKategorie bez: 'BrandSchutz' andKuerzel: 'S'.
ebeneEinsRegiearbeiten := ASDHMErsteEbeneKategorie bez: 'Regiearbeiten' andKuerzel: 'R'.

 ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Abdeckarbeiten' andKuerzel: 'FA')
addChilds: (ASDHMKategorie bez: 'Oberfläche' andKuerzel: 'FAO' );
addChilds: (ASDHMKategorie bez: 'Schutzeinrichtungen' andKuerzel: 'FAS' )).
Repos save: ebeneEins.

 ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Gerüstbau' andKuerzel: 'FG')
addChilds: (ASDHMKategorie bez: 'Gerüst/Arbeitsbühne' andKuerzel: 'FGA' );
addChilds: (ASDHMKategorie bez: 'Schutzeinrichtungen' andKuerzel: 'FGE' )).
Repos save: ebeneEins.

 ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Risssanierung' andKuerzel: 'FR')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FRV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FRS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FRG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FRZ' );
addChilds: (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'FRB' )).
Repos save: ebeneEins.

 ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Putz' andKuerzel: 'FP')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FPV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FPS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FPG' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'FPB' )).
Repos save: ebeneEins.

 ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie bez: 'AnStrich' andKuerzel: 'FS')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FSV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FSS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FSG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FSZ' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'FSB' )).
Repos save: ebeneEins.

 ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Wärmedämmung' andKuerzel: 'FW')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FWV' );
addChilds: (ASDHMKategorie bez: 'DämmschutzPlatte' andKuerzel: 'FWP' );
addChilds: (ASDHMKategorie bez: 'Ammierung/BeFestigung' andKuerzel: 'FWA' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FWZ' );
addChilds: (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'FWB' )).
Repos save: ebeneEins.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Abdeckarbeiten' andKuerzel: 'IA')
addChilds: (ASDHMKategorie bez: 'Oberfläche' andKuerzel: 'IAO' );
addChilds: (ASDHMKategorie bez: 'SchutzEinrichtung' andKuerzel: 'IAE' ) ).
Repos save: ebeneEinsInnen.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Gerüstbau' andKuerzel: 'IG')
addChilds: (ASDHMKategorie bez: 'Gerüst/Arbeitsbühne' andKuerzel: 'IGA' )).
Repos save: ebeneEinsInnen.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Risssanierung'andKuerzel: 'IR')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IRV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IRS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'IRG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'IRZ' );
addChilds: (ASDHMKategorie bez: 'SchutzEinrichtung' andKuerzel: 'IAB' ) ).
Repos save: ebeneEinsInnen.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Putz' andKuerzel: 'IP')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IPV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IPS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'IPG' );
addChilds: (ASDHMKategorie bez: 'SchutzBeschichtung' andKuerzel: 'IPB' ) ).
Repos save: ebeneEinsInnen.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Tapizierarbeiten' andKuerzel: 'IT')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'ITV' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'ITG' );
addChilds: (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'ITT' )).
Repos save: ebeneEinsInnen.


ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'AnStrich' andKuerzel: 'IS')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'ISV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'ISS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'ISG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'ISZ' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'ISB' ) ).
Repos save: ebeneEinsInnen.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Bodenbeschichtung' andKuerzel: 'IB')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IBV' );
addChilds: (ASDHMKategorie bez: 'Beschichtung' andKuerzel: 'IBB' );
addChilds: (ASDHMKategorie bez: 'VeRsiegelung' andKuerzel: 'IBR' )).
Repos save: ebeneEinsInnen.


ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Verlegerarbeitung' andKuerzel: 'IV')
addChilds: (ASDHMKategorie bez: 'Vorbereitng' andKuerzel: 'IVV' );
addChilds: (ASDHMKategorie bez: 'Untergrund' andKuerzel: 'IVU' );
addChilds: (ASDHMKategorie bez: 'Verlegung Oberfläche' andKuerzel: 'IVO' );
addChilds: (ASDHMKategorie bez: 'Verlegung Treppe/Stufe/Podest' andKuerzel: 'IVQ')).
Repos save: ebeneEinsInnen.

ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'TrocKenbau' andKuerzel: 'IK')
addChilds: (ASDHMKategorie bez: 'Deckensysteme' andKuerzel: 'IKD' );
addChilds: (ASDHMKategorie bez: 'Wandsysteme' andKuerzel: 'IKW' );
addChilds: (ASDHMKategorie bez: 'Nebenarbeitung' andKuerzel: 'IKN' )).
Repos save: ebeneEinsInnen.

 ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Wärmedämmung' andKuerzel: 'IW')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IWV' );
addChilds: (ASDHMKategorie bez: 'DämmschutzPlatte' andKuerzel: 'IWP' );
addChilds: (ASDHMKategorie bez: 'Ammierung/BeFestigung' andKuerzel: 'IWF' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IWS' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'IWB' )).
Repos save: ebeneEinsInnen.

ebeneEinsHolz addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'HO')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'HOV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'HOS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'HOG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'HOZ' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'HOB' ) ).
Repos save: ebeneEinsHolz.

ebeneEinsHolz addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Fenster' andKuerzel: 'HF')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'HFV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'HFS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'HFG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'HFZ' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'HFB' ) ).
Repos save: ebeneEinsHolz.

ebeneEinsMetall addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'MO')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'MOV' );
addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'MOS' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'MOG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'MOZ' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'MOB' ) ).
Repos save: ebeneEinsMetall.

ebeneEinsKunststoff addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'KO')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'KOV' );
addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'KOG' );
addChilds: (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'KOZ' );
addChilds: (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'KOB' )).
Repos save: ebeneEinsKunststoff.

ebeneEinsBeton addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'BO')
addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'BOV' );
addChilds: (ASDHMKategorie bez: 'Beschichtung' andKuerzel: 'BOB' )).
Repos save: ebeneEinsBeton.


ebeneEinsBrandSchutz addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Dämmung' andKuerzel: 'SD')
addChilds: (ASDHMKategorie bez: 'Metall/Stahl' andKuerzel: 'SDM' );
addChilds: (ASDHMKategorie bez: 'Holz' andKuerzel: 'SDH' )).
Repos save: ebeneEinsBrandSchutz.


ebeneEinsRegiearbeiten addChilds: ((ASDHMZweiteEbeneKategorie bez: 'Regiearbeiten' andKuerzel: 'R')
addChilds: (ASDHMKategorie bez: 'BaustellenEinrichtung' andKuerzel: 'RE' );
addChilds: (ASDHMKategorie bez: 'StundenLohn' andKuerzel: 'RL' );
addChilds: (ASDHMKategorie bez: 'Geräte/Werkzeuge' andKuerzel: 'RW' )).
Repos save: ebeneEinsRegiearbeiten.
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

{ #category : #accessing }
ASDHMDbModelBase class >> ebeneEinsKategorien [
	self shouldBeImplemented.
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
	"VOMongoRepository current reset."
	VOMongoRepository repositoryContainer: VODynamicContainer new.
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
ASDHMDbModelBase >> artikelCategories [
	^ Repos
		selectMany: ASDEKategorie
		where: [ :each | each type = 'artikelKategorie' ]
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

{ #category : #accessing }
ASDHMDbModelBase >> ebeneEinsKategorien [

	| collection |
	collection := Repos selectAll: ASDHMErsteEbeneKategorie.
	^ collection yourself
]

{ #category : #accessing }
ASDHMDbModelBase >> ebeneEinsKategorienCount [
^ Repos count: ASDHMErsteEbeneKategorie.

]

{ #category : #accessing }
ASDHMDbModelBase >> ebeneZweiKategorienCount [
^ Repos count: ASDHMZweiteEbeneKategorie.

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
ASDHMDbModelBase >> leistungen [

	| collection |
	collection := Repos selectAll: ASDHMLeistungen.
	^ collection yourself
]

{ #category : #accessing }
ASDHMDbModelBase >> leistungenWithKuerzel: idCode [

	| collection |
	collection := Repos
		              selectMany: ASDHMLeistungen
		              where: [ :each | each kategorieKuerzel = idCode ].
	^ collection yourself
]

{ #category : #accessing }
ASDHMDbModelBase >> loggedUsers [

	^ Repos selectMany: ASDEUser where: [ :each | each logged == true ]
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
