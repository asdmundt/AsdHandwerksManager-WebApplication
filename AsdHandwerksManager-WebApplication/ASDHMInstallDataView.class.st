Class {
	#name : #ASDHMInstallDataView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMInstallDataView >> initialize [

	super initialize.
	self model: ASDHMInstallConfig new.

	self idProgress: 'dataProgress'.

	self progression: 0.
	self progressionStep: 0
]

{ #category : #actions }
ASDHMInstallDataView >> loadBaseArtikel [

	| tmpModel data dSize tmpProgressionStep |
	self progression: 0.
	tmpModel := ASDHMDbModelMalerGewerg current.
	data := ASDHMDbModelMalerGewerg importArtikel.
	dSize := data size.
	tmpProgressionStep := 1 / dSize.
	data do: [ :each | 
		tmpModel storeObject: each.
		self progression: self progression + tmpProgressionStep ]
]

{ #category : #rendering }
ASDHMInstallDataView >> renderActionContentOn: html [

	| artikel |
	html mdlButton
		mdlTypographyFontBold;
		onClick:
			(html jQuery ajax script: [ :s | "s << ((s jQuery id: self id) text: '...')."
					 artikel := self loadBaseArtikel.
					 s << (s jQuery: '#artikel' , self id) show setTimeout: 10000.
					 self progression: self progression + self progressionStep ]);
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
				id: 'dataList' , self id;
				with: [ 
					html mdlListItem
						id: 'artikel' , self id;
						style: 'display: none;';
						with: [ 
							html mdlListPrimaryContent: [ 
									html text: 'Artikel Daten installiert' ] ] ] ]
]
