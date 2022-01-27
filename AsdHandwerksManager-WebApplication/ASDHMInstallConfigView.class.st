Class {
	#name : #ASDHMInstallConfigView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMInstallConfigView >> initialize [

	super initialize.
	self model: ASDHMInstallConfig new.
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
ASDHMInstallConfigView >> renderInnerContentOn: html [

	| progression company user blzModel blzData |
	blzModel := ASDHMDbModelBlz current.
	progression := 0.
	self ensureId: html.
	html button
		id: self id;
		class: 'collapsible';
		onClick: (html jQuery ajax script: [ :s | 
					 s << ((s jQuery id: self id) text: '...').
					 company := self loadOwnCompany.
					 s << (s jQuery id: 'firmen') show.
					 user := self loadBaseUser.
					 company addAccounts: user.
					 s << (s jQuery id: 'admin') show.
					 s << ((s jQuery id: 'modalContent') html: [ html mdlSpinner active ]).
					 s << (s jQuery id: 'mainDialog') show.
					s << ((s jQuery id: 'modalContent') html: [ :h | h render: 'Bankdaten laden' ]; setTimeout: 2000).
					blzData := ASDHMDbModelBlz importBlz.
					s << ((s jQuery id: 'modalContent') html: [ :h | h render: blzData size , 'Objekte geladen' ]; setTimeout: 2000).
					blzData doWithIndex: [ :each :index | blzModel storeObject: each.
						progression := progression + 1.
						s << ((s jQuery id: 'modalContent') html: [ :h | h render:'Objekt ', index asString  ,' geladen' ]).
	(Delay forMilliseconds: 1) wait
	 ].
 s << (s jQuery id: 'mainDialog') hide.
s << (s jQuery id: 'blz') show.
					 "setTimeout: 2000" ]);
		with: [ html text: 'Start..' ].
	html div
		class: 'content';
		with: [ 
			html render:
					(MDLProgressBarWidget
						 progression: [ progression ]
						 every: 0.2 seconds).
			html mdlList
				style: 'width: 100%';
				id: 'doList' , self id;
				with: [ 
					html mdlListItem
						id: #firmen;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Firmen Daten installiert' ] ].
					html mdlListItem
						id: #admin;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Admin Benutzer installiert' ] ].
					html mdlListItem
						id: #blz;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Bankleitzahlen installiert' ] ] ] ]
]
