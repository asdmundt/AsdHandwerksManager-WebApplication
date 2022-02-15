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
	self labelUserLoading:  'Benutzer Objekte werden installiert...'.
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
ASDHMInstallConfigView >> loadBaseUser [

	| data user |
	data := ASDHMDbModelBase current.
	user := ASDHMUser benutzerName: 'admin' password: 'pwd' admin: true.
	data storeObject: user.
	^ user
]

{ #category : #actions }
ASDHMInstallConfigView >> loadOwnCompany [

	| data adresse bank eigFirma |
	data := ASDHMDbModelBase current.
	eigFirma := ASDHMEigeneFirma bez: 'Eigentümer Firma'.


	bank := ASDHMBank new.
	bank bankName: 'Commerzbank'.
	bank iban: 'DE22500400000270867500'.
	bank bic: 'COBADEFFXXX'.
	bank kontoInhaber: ''.
	bank bankObjectId: eigFirma id asString.
	data storeObject: bank.

	adresse := ASDHMAdresse bez: 'Firmen Adresse'.
	adresse str: 'Mühlstr.'.
	adresse hsnr: '3'.
	adresse plz: '65779'.
	adresse ort: 'Kelkheim'.
	adresse land: ''.
	adresse bemerkung: ''.
	adresse adresseObjectId: eigFirma id asString.
	data storeObject: adresse.

	eigFirma firmenName: 'Hoxha'.
	eigFirma firmenForm: 'GmbH'.
	eigFirma firmenSitz: 'Kelkheim'.
	eigFirma amtsgerichtSitz: 'Königstein'.
	eigFirma hre: '104487'.
	eigFirma steuerNr: '0402366028t'.
	eigFirma umsatzSteuer: ''.
	eigFirma geschaeftsFuehrer: 'Hamit Hoxha'.
	eigFirma addBankVerbindungen: bank.
	eigFirma addAdresse: adresse.


	data storeObject: eigFirma.

	^ eigFirma
]

{ #category : #rendering }
ASDHMInstallConfigView >> renderActionContentOn: html [

	| company user blzData blzModel progression |
	html mdlButton
		
		mdlTypographyFontBold;
		onClick:
			(html jQuery ajax script: [ :s | "s << ((s jQuery id: self id) text: '...')."
					 s << ((s jQuery: #modalContent) html: [ html text: '...' ]).
					 "s << (s jQuery: #mainDialog) cssAt: 'display' put: 'block'."
					 s << (s jQuery: #mainDialog) show.
					 company := self loadOwnCompany.
					 s << (s jQuery: '#firmen' , self id) show setTimeout: 10000.
					 s << ((s jQuery: #modalContent)
							  html: [ html text: self labelCompanyLoading ];
							  setTimeout: 10000).
					 user := self loadBaseUser.
					 " company addAccounts: user."
					 s << (s jQuery: '#admin' , self id)
						 cssAt: 'display'
						 put: 'block'.
					 s << ((s jQuery: #modalContent)
						  html: [ :h | h mdlSpinner active ];
						  setTimeout: 10000).
					 s << ((s jQuery: #modalContent)
						  html: [ html mdlSpinner active ];
						  setTimeout: 10000).
					 "
					 s << ((s jQuery id: 'modalContent')
						  html: [ :h | h render: 'Bankdaten laden' ];
						  setTimeout: 2000).
					 blzData := ASDHMDbModelBlz importBlz.
					 s << ((s jQuery id: 'modalContent')
						  html: [ :h | h render: blzData size , 'Objekte geladen' ];
						  setTimeout: 2000).
					 blzData doWithIndex: [ :each :index | 
						 blzModel storeObject: each.
						 progression := progression + 1.
						 s << ((s jQuery id: 'modalContent') html: [ :h | 
							  h render: 'Objekt ' , index asString , ' geladen' ]).
						 (Delay forMilliseconds: 1) wait ]."
					 s << (s jQuery: #mainDialog) hide ]);
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
									html text: 'Admin Benutzer installiert' ] ].
					html mdlListItem
						id: 'blz' , self id;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Bankleitzahlen installiert' ] ] ] ]
]
