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
ASDHMLeistungenComponent >> renderAddedArtikelOn: html [

	html div
	id: #divAddedArtikelListe;
		style: 'overflow-y: auto;';
		with: [ 
			html mdlList
				style: 'width: 100%;';
				with: [ 
					self model artikelListe do: [ :name | 
							html mdlListItem: [ html mdlListPrimaryContent: name ] ] ] ]
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
ASDHMLeistungenComponent >> renderDragAndDropArtikelOn: html [

	html div
		id: #divDragAndDropArtikelListe;
		style: 'overflow-y: auto;';
		with: [ 
			html mdlGrid
				shadow: 2;
				with: [ 
					html mdlCell
						class: 'grid-cell-demo';
						desktopSize: 3;
						tabletSize: 2;
						phoneSize: 1;
						desktopOrder: 4;
						tabletOrder: 3;
						phoneOrder: 2;
						with: [ 
							html div
								class: 'mdl-typography--title';
								with: [ 'Liste' ].
							html mdlList
								style: 'width: 100%;';
								with: [ 
									self model artikelListe do: [ :name | 
											html mdlListItem: [ html mdlListPrimaryContent: name ] ] ] ].
					html mdlCell
						class: 'grid-cell-demo';
						desktopSize: 3;
						tabletSize: 2;
						phoneSize: 1;
						desktopOrder: 3;
						tabletOrder: 2;
						phoneOrder: 4;
						with: [ 
							html mdlList
								style: 'width: 100%;';
								with: [ 
									(self session modelMalerGewerk artikelLikeName: 'aString') do: [ 
											:name | 
											html mdlListItem: [ html mdlListPrimaryContent: name ] ] ] ] ] ]
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderInnerContentOn: html [

	html render: (ASDHMFormLeistungen withModel: self model).

	html div
		style: 'width:100%; height:100%;';
		id: #divLeistungenartikelListe;
		with: [ 
			self renderOpenDraggingArtikelOn: html.
self renderAddedArtikelOn: html.
	 ]
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderOpenAddedArtikelOn: html [

	html mdlAnchorButton
		class: 'mdl-button mdl-js-button mdl-button--raised';
		id: html nextId;
		onClick: ((html jQuery id: #divLeistungenartikelListe) load
				 html: [ :ajaxHtml | self renderAddedArtikelOn: ajaxHtml ];
				 onComplete: 'componentHandler.upgradeElements(this);' js);
		with: [ 'ok' ]
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderOpenDraggingArtikelOn: html [

	html mdlAnchorButton class: 'mdl-button mdl-js-button mdl-button--raised';
		id: html nextId;
		onClick: ((html jQuery id: #divLeistungenartikelListe) load
				 html: [ :ajaxHtml | self renderDragAndDropArtikelOn: ajaxHtml ];
				 onComplete: 'componentHandler.upgradeElements(this);' js);
		with: [ 'öffen' ]
]
