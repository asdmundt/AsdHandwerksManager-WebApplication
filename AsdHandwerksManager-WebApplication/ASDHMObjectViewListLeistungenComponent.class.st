Class {
	#name : #ASDHMObjectViewListLeistungenComponent,
	#superclass : #ASDHMObjectViewListBaseComponent,
	#instVars : [
		'labelLeistungsBeschreibung',
		'labelEinheit',
		'labelPreis',
		'labelZeitProEinheit',
		'artikelId',
		'labelKategorieKuerzel',
		'kuerzel'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #actions }
ASDHMObjectViewListLeistungenComponent >> add [

	| newLeistung katKuerzel editor |
	katKuerzel := self session kategorieKuerzel asString.
	newLeistung := ASDHMLeistungen kategorieKuerzel: katKuerzel.
	editor := ASDHMLeistungenComponent withModel: newLeistung.

	self show: editor onAnswer: [ :answer | 
		self session model storeObject: answer.
		self session rootComponent goToOverviewView.
		"self inform: 'Thanks for editing  ' , answer bez" ]
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> artikelId [

	^ artikelId
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> artikelId: anObject [

	artikelId := anObject
]

{ #category : #initilization }
ASDHMObjectViewListLeistungenComponent >> initialize [

	super initialize.
	self id: #listLeistungen
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> kuerzel [

	^ kuerzel
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> kuerzel: anObject [

	kuerzel := anObject
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelEinheit [

	^ labelEinheit
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelEinheit: anObject [

	labelEinheit := anObject
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelKategorieKuerzel [

	^ labelKategorieKuerzel
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelKategorieKuerzel: anObject [

	labelKategorieKuerzel := anObject
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelLeistungsBeschreibung [

	^ labelLeistungsBeschreibung
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelLeistungsBeschreibung: anObject [

	labelLeistungsBeschreibung := anObject
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelPreis [

	^ labelPreis
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelPreis: anObject [

	labelPreis := anObject
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelZeitProEinheit [

	^ labelZeitProEinheit
]

{ #category : #accessing }
ASDHMObjectViewListLeistungenComponent >> labelZeitProEinheit: anObject [

	labelZeitProEinheit := anObject
]

{ #category : #rendering }
ASDHMObjectViewListLeistungenComponent >> renderAddMenu: html [

	| newLeistung katKuerzel |
	katKuerzel := self session kategorieKuerzel asString.
	self session kategorieKuerzel ifNotNil: [ 
		html mdlAnchorButton
			icon;
			id: #add;
			callback: [ self add ];
			with: [ html mdlIcon: 'add' ].
		html mdlTooltip
			for: #add;
			with: katKuerzel
	 ]
]

{ #category : #rendering }
ASDHMObjectViewListLeistungenComponent >> renderDialog: html withModel: aModel [

	| listView formView |
	formView := ASDHMFormLeistungen withModel: aModel.
	html form: [ 
		html mdlDialogTitle: 'Leistungen'.
		html mdlDialogContent: [ html render: formView ].
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: (html jQuery ajax
						 serializeForm;
						 callback: [ "serializeForm;"
							 self session model storeObject: aModel.
							 listView := ASDHMObjectViewListLeistungenComponent withList:
									             (self session model leistungenWithKuerzel:
											              self session kategorieKuerzel).
							 self session kategorieKuerzel: nil ];
						 onComplete: ((html jQuery id: #tableLeistungDiv) load
								  html: [ :ajaxHtml | ajaxHtml render: listView ];
								  onComplete: 'componentHandler.upgradeDom();' js));
				with: 'Accept'.

			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewListLeistungenComponent >> renderDialogMenu: html [

	| newLeistung katKuerzel |
	katKuerzel := self session kategorieKuerzel asString.
	self session kategorieKuerzel ifNotNil: [ 
		html mdlAnchorButton
			icon;
			id: #add;
			openDialogWithId: self rootDialogOpenId;
			onClickUpdateRootDialogWith: [ :r | 
				newLeistung := ASDHMLeistungen kategorieKuerzel: katKuerzel.
				self renderDialog: r withModel: newLeistung ];
			with: [ html mdlIcon: 'add' ].
		html mdlTooltip
			for: #add;
			with: katKuerzel ]
]

{ #category : #rendering }
ASDHMObjectViewListLeistungenComponent >> renderInnerContentOn: html [

	html mdlList
		id: self id;
		with: [ "style: 'width: 300px';"
			self list doWithIndex: [ :each :index | 
					html mdlListItem
						threeLine;
						with: [ 
							html mdlListPrimaryContent: [ 
									html mdlChipContact
										hexColor: '1a71ec';
										with: each kategorieKuerzel.
									html text: each bez.
									html mdlListItemTextBody
										style: 'font-size: 12px;';
										with: each leistungsBeschreibung ].
							html mdlListSecondaryContent: [ 
								html mdlAnchorButton
									icon;
									id: html nextId;
									callback: [ self edit: each ];
									with: [ "html mdlAnchorButton
									icon;
									id: html nextId;
									openDialogWithId: self rootDialogOpenId;
									onClickUpdateRootDialogWith: [ :r | 
										self renderDialog: r withModel: each ];
									with: [ html mdlIcon: 'edit' ] " 
										html mdlIcon: 'edit' ] ] ] ] ]
]
