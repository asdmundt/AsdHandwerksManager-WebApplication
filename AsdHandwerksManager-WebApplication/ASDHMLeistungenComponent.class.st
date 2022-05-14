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
						desktopSize: 4;
						phoneSize: 1;
						with: [ 
							html div
								class: 'mdl-typography--title';
								with: [ 'Liste' ].
							html mdlList
								style: 'width: 100%; height: 400px;';
								with: [ 
									self model artikelListe do: [ :each | 
											html mdlListItem: [ html mdlListPrimaryContent: each name ] ] ] ].
					html mdlCell
						class: 'grid-cell-demo';
						desktopSize: 8;
						desktopOrder: 2;
						with: [ 
							html mdlList
								style: 'width: 100%; height: 400px;';
								with: [ 
									(self session modelMalerGewerk artikelWarengruppe:
											 'Bautenschu') do: [ :each | 
											html mdlListItem: [ html mdlListPrimaryContent: each name ] ] ] ] ] ]
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderInnerContentOn: html [
|artCollection|
artCollection := self session modelMalerGewerk artikel.
self model addArtikel: artCollection first.
	html form: [ 
		html render: (ASDHMFormLeistungen withModel: self model).

		html mdlCard
			shadow: 2;
			mdlTypographyTextLeft;
			style: 'width: 100%';
			with: [ 
				html mdlCardTitleContainer
					style: 'height: 40px;padding: 5px;';
					with: [ html mdlCardTitleText: 'Material Liste' ].

				html mdlCardTextContainer: [ 
					html div
						id: #divDragAndDropArtikelListe;
						style: '';
						with: [ 
							html mdlGrid
								shadow: 2;
								with: [ 
									html mdlCell
										class: 'grid-cell-demo';
										desktopSize: 4;
										phoneSize: 1;
										with: [ 
											html div
												class: 'mdl-typography--title';
												with: [ 'Liste' ].
											html mdlList
												style:
													'width: 100%; height: 400px; background-color: #0d1117;overflow-y: auto;';
												script:
													(html jQuery new droppable onDrop:
															 (html jQuery this load
																  callbackDroppable: [ :event | 
																	  self model addArtikel: (event at: #draggable) ];
																  html: [ :r | self renderSelectedItemsOn: r ]));
												with: [ self renderSelectedItemsOn: html ] ].
									html mdlCell
										class: 'grid-cell-demo';
										desktopSize: 8;
										desktopOrder: 2;
										with: [ 
											html mdlList
												style:
													'width: 100%; height: 400px; background-color: #0d1117;overflow-y: auto;';
												with: [ 
													(self session modelMalerGewerk artikelWarengruppe:
															 'Wand Klebe') do: [ :each | 
															html mdlListItem
																passenger: each;
																script: (html jQuery new draggable revert: true);
																with: [ html text: each name ] ] ] ] ] ] ].

				html mdlCardActions
					border;
					with: [ 
						html mdlButton
							colored;
							beSubmit;
							callback: [ self answer: self model ];
							rippleEffect;
							mdlTypographyFontBold;
							with: 'Get Started' ].

				html mdlCardMenu
					style: 'color: #fff';
					with: [ 
						html mdlButton
							icon;
							rippleEffect;
							with: [ html mdlIcon: 'share' ] ] ] ]
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderOpenAddedArtikelOn: html [

	html mdlAnchorButton
		class: 'mdl-button mdl-js-button mdl-button--raised';
		id: html nextId;
		onClick: ((html jQuery id: #innerLeistungenartikelListe) load
				 html: [ :ajaxHtml | self renderAddedArtikelOn: ajaxHtml ];
				 onComplete: 'componentHandler.upgradeElements(this);' js);
		with: [ 'ok' ]
]

{ #category : #rendering }
ASDHMLeistungenComponent >> renderSelectedItemsOn: html [

	self model artikelListe do: [ :each | 
		html mdlListItem
			passenger: each;
			script:
				(html jQuery new draggable onStop: (html jQuery this effect
							  percent: 1;
							  puff;
							  onComplete: (html jQuery this parent load html: [ :r | 
										   self model artikelListe remove: each ifAbsent: [  ].
										   self renderSelectedItemsOn: r ]))) ]
]
