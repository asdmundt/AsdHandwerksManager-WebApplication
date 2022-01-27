Class {
	#name : #ASDHMInstallDataView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallDataView >> renderInnerContentOn: html [

	| progression company user |
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
					 s
					 <<
						 ((s jQuery id: 'modalContent') html: [ html mdlSpinner active ]).
					 s << (s jQuery id: 'mainDialog') show setTimeout: 2000 ]);
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
						id: #artikel;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Firmen Daten installiert' ] ].
					 ] ]
]
