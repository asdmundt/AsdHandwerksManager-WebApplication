Class {
	#name : #ASDHMInstallDataView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallDataView >> renderActionContentOn: html [

	
	html mdlButton
		mdlTypographyFontBold;
		"onClick: (html jQuery ajax script: [ :s | 
					 s << ((s jQuery id: self id) text: '...').
					 s << ((s jQuery id: 'modalContent') html: [ html text: '...' ]).
					 s << (s jQuery id: 'mainDialog') cssAt: 'display' put: 'block'.
					 company := self loadOwnCompany.
					 s << (s jQuery id: 'firmen' , self id)
						 cssAt: 'display'
						 put: 'block'.
					 user := self loadBaseUser.
					 "" company addAccounts: user.""
					 s << (s jQuery id: 'admin' , self id)
						 cssAt: 'display'
						 put: 'block'.
					 s << ((s jQuery id: 'modalContent')
							  html: [ html mdlSpinner active ];
							  setTimeout: 2000).
					 s << (s jQuery id: 'mainDialog') cssAt: 'display' put: 'block'.
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
						 (Delay forMilliseconds: 1) wait ].
					 s << (s jQuery id: 'mainDialog') cssAt: 'display' put: 'none' ]);"
		with: [ 'Get Started' ]
]

{ #category : #rendering }
ASDHMInstallDataView >> renderInnerContentOn: html [

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
