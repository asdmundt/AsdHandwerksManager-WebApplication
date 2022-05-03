Class {
	#name : #ASDHMInstallConfigView,
	#superclass : #ASDHMInstallerComponent,
	#instVars : [
		'labelConfigLoading',
		'labelCompanyLoading',
		'labelUserLoading'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMInstallConfigView >> initialize [

	super initialize.
	self model: ASDHMInstallConfig new.
	self idTitle: 'configTitle'.
	self idContent: 'configContent'.
	self idProgress: 'configProgress'.
	self labelConfigLoading: 'Grund Installation wird geladen'.
	self labelCompanyLoading: 'Firmen Objekte werden installiert...'.
	self labelUserLoading: 'Benutzer Objekte werden installiert...'.
	self progression: 0.
	self progressionStep: 1 / 4
]

{ #category : #accessing }
ASDHMInstallConfigView >> labelCompanyLoading [

	^ labelCompanyLoading
]

{ #category : #accessing }
ASDHMInstallConfigView >> labelCompanyLoading: anObject [

	labelCompanyLoading := anObject
]

{ #category : #accessing }
ASDHMInstallConfigView >> labelConfigLoading [

	^ labelConfigLoading
]

{ #category : #accessing }
ASDHMInstallConfigView >> labelConfigLoading: anObject [

	labelConfigLoading := anObject
]

{ #category : #accessing }
ASDHMInstallConfigView >> labelUserLoading [

	^ labelUserLoading
]

{ #category : #accessing }
ASDHMInstallConfigView >> labelUserLoading: anObject [

	labelUserLoading := anObject
]

{ #category : #actions }
ASDHMInstallConfigView >> loadBaseBlz [
|  tmpModel data dSize progressionStep |
self progression: 0.
tmpModel :=  ASDHMDbModelBlz current.
data :=  ASDHMDbModelBlz importBlz.
dSize := data size.
progressionStep := 1/dSize.
data do: [ :each | tmpModel storeObject: each.
				self progression: self progression + progressionStep
	 ] 
]

{ #category : #actions }
ASDHMInstallConfigView >> loadBaseLeistungenKategoriebaum [

	| ebeneEins ebeneEinsInnen ebeneEinsHolz ebeneEinsMetall ebeneEinsKunststoff ebeneEinsBeton ebeneEinsBrandSchutz ebeneEinsRegiearbeiten data progressionStep |
	self progression: 0.
	progressionStep := 1 / 18.
	data := ASDHMDbModelBase current.
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

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Abdeckarbeiten' andKuerzel: 'FA')
			 addChilds: (ASDHMKategorie bez: 'Oberfläche' andKuerzel: 'FAO');
			 addChilds:
				 (ASDHMKategorie bez: 'Schutzeinrichtungen' andKuerzel: 'FAS')).
	data storeObject: ebeneEins.
	self progression: self progression + progressionStep.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Gerüstbau' andKuerzel: 'FG')
			 addChilds:
				 (ASDHMKategorie bez: 'Gerüst/Arbeitsbühne' andKuerzel: 'FGA');
			 addChilds:
				 (ASDHMKategorie bez: 'Schutzeinrichtungen' andKuerzel: 'FGE')).
	data storeObject: ebeneEins.
	self progression: self progression + progressionStep.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Risssanierung' andKuerzel: 'FR')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FRV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FRS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FRG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FRZ');
			 addChilds:
				 (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'FRB')).
	data storeObject: ebeneEins.
	self progression: self progression + progressionStep.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Putz' andKuerzel: 'FP')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FPV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FPS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FPG');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'FPB')).
	data storeObject: ebeneEins.
	self progression: self progression + progressionStep.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'AnStrich' andKuerzel: 'FS')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FSV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'FSS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'FSG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FSZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'FSB')).
	data storeObject: ebeneEins.
	self progression: self progression + progressionStep.

	ebeneEins addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Wärmedämmung' andKuerzel: 'FW')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'FWV');
			 addChilds:
				 (ASDHMKategorie bez: 'DämmschutzPlatte' andKuerzel: 'FWP');
			 addChilds:
				 (ASDHMKategorie bez: 'Ammierung/BeFestigung' andKuerzel: 'FWA');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'FWZ');
			 addChilds:
				 (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'FWB')).
	data storeObject: ebeneEins.
	self progression: self progression + progressionStep.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Abdeckarbeiten' andKuerzel: 'IA')
			 addChilds: (ASDHMKategorie bez: 'Oberfläche' andKuerzel: 'IAO');
			 addChilds:
				 (ASDHMKategorie bez: 'SchutzEinrichtung' andKuerzel: 'IAE')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Gerüstbau' andKuerzel: 'IG') 
			 addChilds:
			 (ASDHMKategorie bez: 'Gerüst/Arbeitsbühne' andKuerzel: 'IGA')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Risssanierung' andKuerzel: 'IR')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IRV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IRS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'IRG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'IRZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchutzEinrichtung' andKuerzel: 'IAB')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Putz' andKuerzel: 'IP')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IPV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IPS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'IPG');
			 addChilds:
				 (ASDHMKategorie bez: 'SchutzBeschichtung' andKuerzel: 'IPB')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Tapizierarbeiten' andKuerzel: 'IT')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'ITV');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'ITG');
			 addChilds:
				 (ASDHMKategorie bez: 'Schlussbeschichtung' andKuerzel: 'ITT')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.


	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'AnStrich' andKuerzel: 'IS')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'ISV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'ISS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'ISG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'ISZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'ISB')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.

	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie
			  bez: 'Bodenbeschichtung'
			  andKuerzel: 'IB')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IBV');
			 addChilds: (ASDHMKategorie bez: 'Beschichtung' andKuerzel: 'IBB');
			 addChilds: (ASDHMKategorie bez: 'VeRsiegelung' andKuerzel: 'IBR')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.

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
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.
	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'TrocKenbau' andKuerzel: 'IK')
			 addChilds: (ASDHMKategorie bez: 'Deckensysteme' andKuerzel: 'IKD');
			 addChilds: (ASDHMKategorie bez: 'Wandsysteme' andKuerzel: 'IKW');
			 addChilds:
				 (ASDHMKategorie bez: 'Nebenarbeitung' andKuerzel: 'IKN')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.
	ebeneEinsInnen addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Wärmedämmung' andKuerzel: 'IW')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'IWV');
			 addChilds:
				 (ASDHMKategorie bez: 'DämmschutzPlatte' andKuerzel: 'IWP');
			 addChilds:
				 (ASDHMKategorie bez: 'Ammierung/BeFestigung' andKuerzel: 'IWF');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'IWS');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'IWB')).
	data storeObject: ebeneEinsInnen.
	self progression: self progression + progressionStep.
	ebeneEinsHolz addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'HO')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'HOV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'HOS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'HOG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'HOZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'HOB')).
	data storeObject: ebeneEinsHolz.
	self progression: self progression + progressionStep.
	ebeneEinsHolz addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Fenster' andKuerzel: 'HF')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'HFV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'HFS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'HFG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'HFZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'HFB')).
	data storeObject: ebeneEinsHolz.
	self progression: self progression + progressionStep.
	ebeneEinsMetall addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'MO')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'MOV');
			 addChilds: (ASDHMKategorie bez: 'Spachteln' andKuerzel: 'MOS');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'MOG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'MOZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'MOB')).
	data storeObject: ebeneEinsMetall.
	self progression: self progression + progressionStep.
	ebeneEinsKunststoff addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'KO')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'KOV');
			 addChilds: (ASDHMKategorie bez: 'Grundierung' andKuerzel: 'KOG');
			 addChilds:
				 (ASDHMKategorie bez: 'Zwischenbeschichtung' andKuerzel: 'KOZ');
			 addChilds:
				 (ASDHMKategorie bez: 'SchlussBeschichtung' andKuerzel: 'KOB')).
	data storeObject: ebeneEinsKunststoff.
	self progression: self progression + progressionStep.
	ebeneEinsBeton addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Oberfläche' andKuerzel: 'BO')
			 addChilds: (ASDHMKategorie bez: 'Vorbereitung' andKuerzel: 'BOV');
			 addChilds: (ASDHMKategorie bez: 'Beschichtung' andKuerzel: 'BOB')).
	data storeObject: ebeneEinsBeton.
	self progression: self progression + progressionStep.

	ebeneEinsBrandSchutz addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Dämmung' andKuerzel: 'SD')
			 addChilds: (ASDHMKategorie bez: 'Metall/Stahl' andKuerzel: 'SDM');
			 addChilds: (ASDHMKategorie bez: 'Holz' andKuerzel: 'SDH')).
	data storeObject: ebeneEinsBrandSchutz.
	self progression: self progression + progressionStep.

	ebeneEinsRegiearbeiten addChilds:
		((ASDHMZweiteEbeneKategorie bez: 'Regiearbeiten' andKuerzel: 'R')
			 addChilds:
				 (ASDHMKategorie bez: 'BaustellenEinrichtung' andKuerzel: 'RE');
			 addChilds: (ASDHMKategorie bez: 'StundenLohn' andKuerzel: 'RL');
			 addChilds:
				 (ASDHMKategorie bez: 'Geräte/Werkzeuge' andKuerzel: 'RW')).
	data storeObject: ebeneEinsRegiearbeiten.
	self progression: self progression + progressionStep
]

{ #category : #actions }
ASDHMInstallConfigView >> loadBaseUser [

	ASDHMDbModelBase createAdmin. 
	ASDHMDbModelBase createUserOffice.
	ASDHMDbModelBase createUserProjekt.
	
]

{ #category : #actions }
ASDHMInstallConfigView >> loadOwnCompany [

	| data adresse bank eigFirma |
	data := ASDHMDbModelBase createEigFirma.

	self progression: self progression + 0.2.

]

{ #category : #rendering }
ASDHMInstallConfigView >> renderActionContentOn: html [

	| company user blzData katModel |
	html mdlButton
		mdlTypographyFontBold;
		onClick:
			(html jQuery ajax script: [ :s | "s << ((s jQuery id: self id) text: '...')."
					 company := self loadOwnCompany.
					 s << (s jQuery: '#firmen' , self id) show setTimeout: 10000.
					 self progression: self progression + self progressionStep.
					 user := self loadBaseUser.
					 " company addAccounts: user."
					 s << (s jQuery: '#admin' , self id) show setTimeout: 10000.
					self progression: self progression + self progressionStep.
					 
					 blzData := self loadBaseBlz.
					 s << (s jQuery: '#blz' , self id) show setTimeout: 10000.
					self progression: self progression + self progressionStep.
					 katModel := self loadBaseLeistungenKategoriebaum.
					 s << (s jQuery: '#katBaum' , self id) show setTimeout: 10000.
					self progression: self progression + self progressionStep.
					 ]);
		with: [ 'Get Started' ]
]

{ #category : #rendering }
ASDHMInstallConfigView >> renderInnerContentOn: html [

	self ensureId: html.

	html div
		class: 'content';
		with: [ 
			self renderProgressContentOn: html.
			html mdlList
				style: 'width: 100%';
				id: 'doList' , self id;
				with: [ 
					html mdlListItem
						id: 'firmen' , self id;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Firmen Daten installiert' ] ].
					html mdlListItem
						id: 'admin' , self id;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Benutzer installiert' ] ].
					html mdlListItem
						id: 'blz' , self id;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Bankleitzahlen installiert' ] ].
					html mdlListItem
						id: 'katBaum' , self id;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Leistungskategorien installiert' ] ] ] ]
]
