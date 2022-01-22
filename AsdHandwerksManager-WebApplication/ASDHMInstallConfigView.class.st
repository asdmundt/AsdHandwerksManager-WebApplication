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

{ #category : #rendering }
ASDHMInstallConfigView >> renderInnerContentOn: html [

	| progression |
	self ensureId: html.
	html button
		id: self id;
		class: 'collapsible';
		onClick: (html jQuery ajax script: [ :s | 
					 s << ((s jQuery id: self id) text: 'Completed').
					 s << ((s jQuery id: 'modalContent') append: [ 
								  html render: self taskActionComponent ]).
					 s << (s jQuery id: 'mainDialog') show ]);
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
						id: 'firmen' , self id;
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Firmen Daten installiert' ] ].
					html mdlListItem
						id: 'admin' , self id;
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Admin Benutzer installiert' ] ].
					html mdlListPrimaryContent: [ 
						html text: 'Admin Benutzer installiert' ] ] ]
]
