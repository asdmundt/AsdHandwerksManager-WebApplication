Class {
	#name : #ASDHMObjectViewTableLeistungenComponent,
	#superclass : #ASDHMObjectViewTableBaseComponent,
	#instVars : [
		'labelAddLeistungsBeschreibung',
		'labelLeistungsBeschreibung',
		'labelEinheit',
		'labelPreis',
		'labelArtikel',
		'labelArtikelGroesse'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMObjectViewTableLeistungenComponent class >> withList: aList [
^ self new list: aList
]

{ #category : #initialization }
ASDHMObjectViewTableLeistungenComponent >> initialize [ 
super initialize.
self labelBez: 'Leistungsbeschreibung'.
self labelLeistungsBeschreibung:'Beschreibung'.
self labelEinheit: 'Einheit'. 
self labelPreis: 'Preis'.
self labelArtikel: 'Artikel'.
self labelArtikelGroesse: 'LieferMenge'.
"self id: #tableLeistungDiv"

]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelAddLeistungsBeschreibung [

	^ labelAddLeistungsBeschreibung
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelAddLeistungsBeschreibung: anObject [

	labelAddLeistungsBeschreibung := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelArtikel [

	^ labelArtikel
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelArtikel: anObject [

	labelArtikel := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelArtikelGroesse [

	^ labelArtikelGroesse
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelArtikelGroesse: anObject [

	labelArtikelGroesse := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelEinheit [

	^ labelEinheit
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelEinheit: anObject [

	labelEinheit := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelLeistungsBeschreibung [

	^ labelLeistungsBeschreibung
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelLeistungsBeschreibung: anObject [

	labelLeistungsBeschreibung := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelPreis [

	^ labelPreis
]

{ #category : #accessing }
ASDHMObjectViewTableLeistungenComponent >> labelPreis: anObject [

	labelPreis := anObject
]

{ #category : #rendering }
ASDHMObjectViewTableLeistungenComponent >> renderDialog: html withModel: aModel [

	| leistungsTable leistungen|
	
	html form: [ 
		html mdlDialogTitle: self labelAddLeistungsBeschreibung.
		html mdlDialogContent: [ 
			
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelLeistungsBeschreibung.
					html mdlTextFieldInput
				id: html lastId;
				"rows: 4;"
						
						callback: [ :input | aModel leistungsBeschreibung: input ];
						value: aModel leistungsBeschreibung
						 ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelEinheit.
					html mdlTextFieldInput
						id: html lastId;
						size: 4;
						callback: [ :input | aModel einheit: input ];
						value: aModel einheit
						 ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelPreis.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel preis: input ];
						value: aModel preis
						 ]				
						 ] ].
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: 
								(html jQuery ajax
						serializeForm;
						callback: [ "serializeForm;"
							self session model storeObject: aModel.
							leistungen:= self session leistungen. 
							leistungsTable := self class withList: self session model leistungen.
							 ];
						onComplete:
							((html jQuery id: #tableLeistungDiv) parent load
								html: [ :ajaxHtml | ajaxHtml render: leistungsTable ];
								onComplete: 'componentHandler.upgradeElements(this);' js));
			
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ] 
]

{ #category : #rendering }
ASDHMObjectViewTableLeistungenComponent >> renderDialogMenu: html [
| newLeistungen |
	newLeistungen := ASDHMLeistungen new.
html mdlAnchorButton
								icon;
								id: html nextId;
								openDialogWithId: self rootDialogOpenId;
								onClickUpdateRootDialogWith: [ :r | self renderDialog: r withModel: newLeistungen ];
								with: [ html mdlIcon: 'add' ].
]

{ #category : #rendering }
ASDHMObjectViewTableLeistungenComponent >> renderInnerContentOn: html [

	html mdlTable
		shadow: 0;
		with: [ 
			html tableHead: [ 
					html tableRow
						style: 'background-color: #161b22; ';
						with: [ 
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px; width: 200px;';
								with: self labelLeistungsBeschreibung.
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelEinheit.
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelPreis.
								html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px; width: 30px;';
								with: self labelEdit.
								 ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				self list doWithIndex: [ :each :index | 
					html tableRow: [ 
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117; max-width: 50%; height: 100px;';
							with: [html div style: 'background-color: #0d1117; width: 300px; height: 100px;'; with: [ html text: each leistungsBeschreibung ] ].
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117; max-width: 20px;';
							with: each einheit.
					 html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117; max-width: 20px;';
							with: each preis.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: [ html mdlAnchorButton
								icon;
								id: html nextId;
								
								with: [ html mdlIcon: 'edit' ]].
												
							 ] ] ] ]
]
