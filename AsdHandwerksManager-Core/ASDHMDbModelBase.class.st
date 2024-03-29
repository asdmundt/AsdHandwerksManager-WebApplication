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
	ebeneEinsInnen := ASDHMErsteEbeneKategorie
		                  bez: 'Innenraum'
		                  andKuerzel: 'I'.
	ebeneEinsHolz := ASDHMErsteEbeneKategorie bez: 'Holz' andKuerzel: 'H'.
	ebeneEinsMetall := ASDHMErsteEbeneKategorie
		                   bez: 'Metall'
		                   andKuerzel: 'M'.
	ebeneEinsKunststoff := ASDHMErsteEbeneKategorie
		                       bez: 'Kunststoff'
		                       andKuerzel: 'K'.
	ebeneEinsBeton := ASDHMErsteEbeneKategorie
		                  bez: 'Beton'
		                  andKuerzel: 'B'.
	ebeneEinsBrandSchutz := ASDHMErsteEbeneKategorie
		                        bez: 'BrandSchutz'
		                        andKuerzel: 'S'.
	ebeneEinsRegiearbeiten := ASDHMErsteEbeneKategorie
		                          bez: 'Regiearbeiten'
		                          andKuerzel: 'R'.

	ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Fasade/Abdeckarbeiten'
			  andKuerzel: 'FA')
			 addChilds: (ASDHMKategorie
					  bez: 'Fasade/Abdeckarbeiten/Oberfläche'
					  andKuerzel: 'FAO');
			 addChilds: (ASDHMKategorie
					  bez: 'Fasade/Abdeckarbeiten/Schutzeinrichtungen'
					  andKuerzel: 'FAS')).
	Repos save: ebeneEins.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Fasade/Gerüstbau' andKuerzel: 'FG')
			 addChilds:
				 (ASDHMKategorie bez: 'Gerüst/Arbeitsbühne' andKuerzel: 'FGA');
			 addChilds:
				 (ASDHMKategorie bez: 'Schutzeinrichtungen' andKuerzel: 'FGE')).
	Repos save: ebeneEins.

	ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Fasade/Risssanierung'
			  andKuerzel: 'FR')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FRV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FRS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FRG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FRZ');
			 addChilds:
				 (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'FRB')).
	Repos save: ebeneEins.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Fasade/Putz' andKuerzel: 'FP')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FPV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FPS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FPG');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'FPB')).
	Repos save: ebeneEins.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Fasade/AnStrich' andKuerzel: 'FS')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FSV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FSS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FSG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FSZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'FSB')).
	Repos save: ebeneEins.

	ebeneEins addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Fasade/Wärmedämmung'
			  andKuerzel: 'FW')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FWV');
			 addChilds:
				 (ASDHMKategorie bez: 'DämmschutzPlatte' andKuerzel: 'FWP');
			 addChilds:
				 (ASDHMKategorie bez: 'Ammierung/BeFestigung' andKuerzel: 'FWA');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FWZ');
			 addChilds:
				 (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'FWB')).
	Repos save: ebeneEins.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/Abdeckarbeiten'
			  andKuerzel: 'IA')
			 addChilds: (ASDHMKategorie bez: 'Oberfläche' andKuerzel: 'IAO');
			 addChilds:
				 (ASDHMKategorie bez: 'SchutzEinrichtung' andKuerzel: 'IAE')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/Gerüstbau'
			  andKuerzel: 'IG') addChilds:
			 (ASDHMKategorie bez: 'Gerüst/Arbeitsbühne' andKuerzel: 'IGA')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/Risssanierung'
			  andKuerzel: 'IR')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IRV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IRS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'IRG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'IRZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchutzEinrichtung' andKuerzel: 'IAB')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Innenraum/Putz' andKuerzel: 'IP')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IPV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IPS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'IPG');
			 addChilds:
				 (ASDHMKategorie bez: 'SchutzBeschichtung' andKuerzel: 'IPB')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/Tapizierarbeiten'
			  andKuerzel: 'IT')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'ITV');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'ITG');
			 addChilds:
				 (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'ITT')).
	Repos save: ebeneEinsInnen.


	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/AnStrich'
			  andKuerzel: 'IS')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'ISV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'ISS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'ISG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'ISZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'ISB')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/Bodenbeschichtung'
			  andKuerzel: 'IB')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IBV');
			 addChilds: (ASDHMKategorie bez: 'Beschichtung' andKuerzel: 'IBB');
			 addChilds: (ASDHMKategorie bez: 'VeRsiegelung' andKuerzel: 'IBR')).
	Repos save: ebeneEinsInnen.


	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie
			  bez: 'Verlegerarbeitung'
			  andKuerzel: 'IV')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitng' andKuerzel: 'IVV');
			 addChilds: (ASDHMKategorie bez: 'Untergrund' andKuerzel: 'IVU');
			 addChilds:
				 (ASDHMKategorie bez: 'Verlegung Oberfläche' andKuerzel: 'IVO');
			 addChilds:
				 (ASDHMKategorie
					  bez: 'Verlegung Treppe/Stufe/Podest'
					  andKuerzel: 'IVQ')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/TrocKenbau'
			  andKuerzel: 'IK')
			 addChilds: (ASDHMKategorie bez: 'Deckensysteme' andKuerzel: 'IKD');
			 addChilds: (ASDHMKategorie bez: 'Wandsysteme' andKuerzel: 'IKW');
			 addChilds:
				 (ASDHMKategorie bez: 'Nebenarbeitung' andKuerzel: 'IKN')).
	Repos save: ebeneEinsInnen.

	ebeneEinsInnen addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Innenraum/Wärmedämmung'
			  andKuerzel: 'IW')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IWV');
			 addChilds:
				 (ASDHMKategorie bez: 'DämmschutzPlatte' andKuerzel: 'IWP');
			 addChilds:
				 (ASDHMKategorie bez: 'Ammierung/BeFestigung' andKuerzel: 'IWF');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IWS');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'IWB')).
	Repos save: ebeneEinsInnen.

	ebeneEinsHolz addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Holz/Oberfläche' andKuerzel: 'HO')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'HOV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'HOS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'HOG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'HOZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'HOB')).
	Repos save: ebeneEinsHolz.

	ebeneEinsHolz addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Holz/Fenster' andKuerzel: 'HF')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'HFV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'HFS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'HFG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'HFZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'HFB')).
	Repos save: ebeneEinsHolz.

	ebeneEinsMetall addChilds:
		((ASDHMZweiteEbeneKategorie
			  bez: 'Metall/Oberfläche'
			  andKuerzel: 'MO')
			 addChilds: (ASDHMKategorie
					  bez: 'Metall/Oberfläche/Vorbereitung'
					  andKuerzel: 'MOV');
			 addChilds:
				 (ASDHMKategorie
					  bez: 'Metall/Oberfläche/Spachteln'
					  andKuerzel: 'MOS');
			 addChilds:
				 (ASDHMKategorie
					  bez: 'Metall/Oberfläche/Grundierung'
					  andKuerzel: 'MOG');
			 addChilds: (ASDHMKategorie
					  bez: 'Metall/Oberfläche/Zwischenbeschichtung'
					  andKuerzel: 'MOZ');
			 addChilds: (ASDHMKategorie
					  bez: 'Metall/Oberfläche/SchlussBeschichtung'
					  andKuerzel: 'MOB')).
	Repos save: ebeneEinsMetall.

	ebeneEinsKunststoff addChilds: ((ASDHMZweiteEbeneKategorie
			  bez: 'Kunststoff/Oberfläche'
			  andKuerzel: 'KO')
			 addChilds: (ASDHMKategorie
					  bez: 'Kunststoff/Oberfläche/Vorbereitung'
					  andKuerzel: 'KOV');
			 addChilds: (ASDHMKategorie
					  bez: 'Kunststoff/Oberfläche/Grundierung'
					  andKuerzel: 'KOG');
			 addChilds: (ASDHMKategorie
					  bez: 'Kunststoff/Oberfläche/Zwischenbeschichtung'
					  andKuerzel: 'KOZ');
			 addChilds: (ASDHMKategorie
					  bez: 'Kunststoff/Oberfläche/SchlussBeschichtung'
					  andKuerzel: 'KOB')).
	Repos save: ebeneEinsKunststoff.

	ebeneEinsBeton addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Beton/Oberfläche' andKuerzel: 'BO')
			 addChilds: (ASDHMKategorie bez: 'Beton/Oberfläche/Vorbereitung' andKuerzel: 'BOV');
			 addChilds: (ASDHMKategorie bez: 'Beton/Oberfläche/Beschichtung' andKuerzel: 'BOB')).
	Repos save: ebeneEinsBeton.


	ebeneEinsBrandSchutz addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Dämmung' andKuerzel: 'SD')
			 addChilds: (ASDHMKategorie bez: 'Metall/Stahl' andKuerzel: 'SDM');
			 addChilds: (ASDHMKategorie bez: 'Holz' andKuerzel: 'SDH')).
	Repos save: ebeneEinsBrandSchutz.


	ebeneEinsRegiearbeiten addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Regiearbeiten' andKuerzel: 'R')
			 addChilds:
				 (ASDHMKategorie bez: 'BaustellenEinrichtung' andKuerzel: 'RE');
			 addChilds: (ASDHMKategorie bez: 'StundenLohn' andKuerzel: 'RL');
			 addChilds:
				 (ASDHMKategorie bez: 'Geräte/Werkzeuge' andKuerzel: 'RW')).
	Repos save: ebeneEinsRegiearbeiten
]

{ #category : #voyage }
ASDHMDbModelBase class >> createEigFirma [
|model eigFirma|
model := ASDHMDbModelBase current.
eigFirma := ASDHMEigeneFirma bez: 'Eigentümer Firma'. 



eigFirma firmenName: 'Hoxha'.
eigFirma str: 'Mühlstr.'.
eigFirma hsnr: '3'.
eigFirma plz: '65779'.
eigFirma ort: 'Kelkheim'.
eigFirma firmenForm: 'GmbH'.
eigFirma firmenSitz: 'Kelkheim'.
eigFirma amtsgerichtSitz: 'Königstein'.
eigFirma hre: '104487'.
eigFirma steuerNr: '0402366028t'.
eigFirma umsatzSteuer: ''.
eigFirma geschaeftsFuehrer: 'Hamit Hoxha'.
eigFirma bankName: 'Commerzbank'.
eigFirma iban: 'DE22500400000270867500'.
eigFirma bic: 'COBADEFFXXX'.
eigFirma kontoInhaber: ''.


model storeObject: eigFirma.

]

{ #category : #voyage }
ASDHMDbModelBase class >> createUserOffice [

	Repos save: (ASDHMUser
			 benutzerName: 'sonja'
			 password: 'saino1972'
			 admin: true
			 role: 'office').
	Repos save: (ASDHMUser
			 benutzerName: 'soehnke'
			 password: 'saino1972'
			 admin: true
			 role: 'office').
	Repos save: (ASDHMUser
			 benutzerName: 'janina'
			 password: 'janinaOffice'
			 admin: true
			 role: 'office')
]

{ #category : #voyage }
ASDHMDbModelBase class >> createUserProjekt [

	Repos save: (ASDHMUser
			 benutzerName: 'tobias'
			 password: 'tobiasProjekt'
			 admin: true
			 role: 'projekt').
	Repos save: (ASDHMUser
			 benutzerName: 'avni'
			 password: 'avniProjekt'
			 admin: true
			 role: 'projekt').
	Repos save: (ASDHMUser
			 benutzerName: 'agon'
			 password: 'agonProjekt'
			 admin: true
			 role: 'projekt')
]

{ #category : #'class initialization' }
ASDHMDbModelBase class >> current [
	^ uniqueInstanceDbModelBauManagerBase ifNil: [ uniqueInstanceDbModelBauManagerBase := self new ]
]

{ #category : #'default values' }
ASDHMDbModelBase class >> defaultPwd [

	^ 'saino1972'
]

{ #category : #'default values' }
ASDHMDbModelBase class >> defaultRepository [
	^ 'handwerkBase'
]

{ #category : #'default values' }
ASDHMDbModelBase class >> defaultUser [

	^ 'hoxha'
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
ASDHMDbModelBase class >> initializeStratoHostMongoDB [

	Repos := VOMongoRepository
		         host: '81.169.136.23'
		         database: self defaultRepository
		         username: self defaultUser
		         password: self defaultPwd
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
	self initializeStratoHostMongoDB
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
ASDHMDbModelBase >> auftraege [

	| collection |
	collection := Repos selectAll: ASDHMAuftrag.
	^ collection yourself
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
