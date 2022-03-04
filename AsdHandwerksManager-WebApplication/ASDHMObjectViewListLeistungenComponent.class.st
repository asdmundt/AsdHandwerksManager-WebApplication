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

{ #category : #actions }
ASDHMObjectViewListLeistungenComponent >> renderDialog: html withModel: aModel [

	| listView formWiev |
	formWiev := ASDHMFormLeistungen
		            withModel: aModel.
	html form: [ 
		html mdlDialogTitle: 'Leistungen'.
		html mdlDialogContent: [ html render: formWiev ].
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
											              self session kategorieKuerzel) ];
						 onComplete: ((html jQuery id: #tableLeistungDiv) load
								  html: [ :ajaxHtml | ajaxHtml render: listView ];
								  onComplete: 'componentHandler.upgradeElements(this);' js));
				with: 'Accept'.

			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #actions }
ASDHMObjectViewListLeistungenComponent >> renderDialogMenu: html [

	| newContact katKuerzel |
	katKuerzel := self session kategorieKuerzel asString.
	katKuerzel ifNotNil: [ 
		newContact := ASDHMLeistungen kategorieKuerzel: katKuerzel.
		html mdlAnchorButton
			icon;
			id: html nextId;
			openDialogWithId: self rootDialogOpenId;
			onClickUpdateRootDialogWith: [ :r | 
				self renderDialog: r withModel: newContact ];
			with: [ html mdlIcon: 'add' ].
		html mdlTooltip
			for: html lastId;
			with: '_' , newContact kategorieKuerzel asString ]
]

{ #category : #rendering }
ASDHMObjectViewListLeistungenComponent >> renderInnerContentOn: html [

	html mdlList
		style: 'width: 300px';
		with: [ 
			self list doWithIndex: [ :each :index | 
					html mdlListItem: [ 
							html mdlListPrimaryContent:
									each bez , ' ' , each kategorieKuerzel ] ] ]
]
