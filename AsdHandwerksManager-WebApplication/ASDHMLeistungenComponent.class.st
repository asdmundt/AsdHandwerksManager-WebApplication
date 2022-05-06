Class {
	#name : #ASDHMLeistungenComponent,
	#superclass : #ASDHMObjectViewComponent,
	#instVars : [
		'labelArtikelDialogTitle'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMLeistungenComponent >> initialize [

	super initialize.
	self labelHeaderTitle: 'Leistungsbeschreibung'.
	self labelArtikelDialogTitle: 'ArtikelListe'
]

{ #category : #accessing }
ASDHMLeistungenComponent >> labelArtikelDialogTitle [

	^ labelArtikelDialogTitle
]

{ #category : #accessing }
ASDHMLeistungenComponent >> labelArtikelDialogTitle: anObject [

	labelArtikelDialogTitle := anObject
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderAddArtikelDialog: html withModel: aModel [

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
ASDHMLeistungenComponent >> renderDialog: html withModel: aModel [

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
ASDHMLeistungenComponent >> renderOpenAddedArtikelOn: html [

	html mdlAnchorButton
		icon;
		id: html nextId;
		openDialogWithId: self rootDialogOpenId;
		onClickUpdateRootDialogWith: [ :r | 
			self renderDialog: r withModel: self model ];
		with: [ html mdlIcon: 'open' ]
]
