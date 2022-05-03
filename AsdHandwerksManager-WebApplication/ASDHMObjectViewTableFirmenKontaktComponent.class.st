Class {
	#name : #ASDHMObjectViewTableFirmenKontaktComponent,
	#superclass : #ASDHMObjectViewTableBaseContactComponent,
	#instVars : [
		'labelFirmenName',
		'labelFirmenForm',
		'labelansprechpartner'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTableFirmenKontaktComponent >> initialize [

	super initialize.
	self labelBez: 'Gewerbe Kontakt'.
	self labelFirmenName: 'Firmen Name'.
	self labelFirmenForm: 'Rechtsform'.
	self labelansprechpartner: 'Ansprechpartner'.
	self labelAddContact: 'Neuer gewerblicher Kontakt'
	
]

{ #category : #accessing }
ASDHMObjectViewTableFirmenKontaktComponent >> labelFirmenForm [

	^ labelFirmenForm
]

{ #category : #accessing }
ASDHMObjectViewTableFirmenKontaktComponent >> labelFirmenForm: anObject [

	labelFirmenForm := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableFirmenKontaktComponent >> labelFirmenName [

	^ labelFirmenName
]

{ #category : #accessing }
ASDHMObjectViewTableFirmenKontaktComponent >> labelFirmenName: anObject [

	labelFirmenName := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableFirmenKontaktComponent >> labelansprechpartner [

	^ labelansprechpartner
]

{ #category : #accessing }
ASDHMObjectViewTableFirmenKontaktComponent >> labelansprechpartner: anObject [

	labelansprechpartner := anObject
]

{ #category : #rendering }
ASDHMObjectViewTableFirmenKontaktComponent >> renderDialog: html withModel: aModel [

	| contactTable |
	html form: [ 
		html mdlDialogTitle: self labelAddContact.
		html mdlDialogContent: [ 
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelFirmenName.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel firmenName: input ];
						value: aModel firmenName ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelFirmenForm.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel firmenForm: input ];
						value: aModel firmenForm ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelansprechpartner.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel ansprechPartner: input ];
						value: aModel ansprechPartner ] ].
			self renderAddressFields: html withModel: aModel.
			self renderKommunicationsFields: html withModel: aModel ].
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: (html jQuery ajax
						 serializeForm;
						 callback: [ "serializeForm;"
							 self session model storeObject: aModel.
							 contactTable := ASDHMObjectViewTableFirmenKontaktComponent 
								                 withList: self session model firmen ];
						 onComplete: ((html jQuery id: #tableDiv) load
								  html: [ :ajaxHtml | ajaxHtml render: contactTable ];
								  onComplete: 'componentHandler.upgradeElements(this);' js));
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableFirmenKontaktComponent >> renderDialogMenu: html [
| newContact |
	newContact := ASDHMFirma new.
html mdlAnchorButton
								icon;
								id: html nextId;
								openDialogWithId: self rootDialogOpenId;
								onClickUpdateRootDialogWith: [ :r | self renderDialog: r withModel: newContact ];
								with: [ html mdlIcon: 'add' ].
]

{ #category : #rendering }
ASDHMObjectViewTableFirmenKontaktComponent >> renderInnerContentOn: html [

	html mdlTable
		shadow: 0;
		with: [ 
			html tableHead: [ 
					html tableRow
						style: 'background-color: #161b22; ';
						with: [ 
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelFirmenName.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelFirmenForm.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelansprechpartner.
							self renderTableHeadingCommunnikationsData: html.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelEdit ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				list doWithIndex: [ :each :index | 
					html tableRow: [ 
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each firmenName.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each firmenForm.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each ansprechPartner.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each telefonNummer.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each mobilFunkNr.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each email.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: [ 
								html mdlAnchorButton
									icon;
									id: html nextId;
									openDialogWithId: self rootDialogOpenId;
									onClickUpdateRootDialogWith: [ :r | 
										self renderDialog: r withModel: each ];
									with: [ html mdlIcon: 'edit' ] ] ] ] ] ]
]
