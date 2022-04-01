Class {
	#name : #ASDHMObjectViewTableContactComponent,
	#superclass : #ASDHMObjectViewTableBaseContactComponent,
	#instVars : [
		'labelGewerblich',
		'tooltipSelectGewerblich'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTableContactComponent >> initialize [

	super initialize.
	self labelBez: 'Kontakte'.
	self labelDisplayString: 'Name'.
	self labelContact: 'Kontakt'.
	self labelGewerblich: 'Kontakt Art'.
	self tooltipSelectGewerblich: 'Bitte auswählen, ob der Kontakt privat oder gewerblich ist'
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelGewerblich [

	^ labelGewerblich
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelGewerblich: anObject [

	labelGewerblich := anObject
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderDialog: html [

	| newContact |
	newContact := ASDHMContact new.
	html form: [ 
		html mdlDialogTitle: self labelAddContact.
		html mdlDialogContent: [  html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelDisplayString.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact displayName: input ] ]. 
			html span: [
							html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelAnrede.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact anrede: input ] ].
				html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelTitle.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact title: input ] ].
				html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelVorname.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact vorname: input ] ].
				html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelNachname.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact nachname: input ] ].
				].
			html span:[ 
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelTelefonNr.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact telefonNummer: input ] ].	
				html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelMobileFunkNr.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact mobilFunkNr: input ] ].
				html mdlTextFieldContainer with: [ "floatingLabel;"
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelEmail.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact email: input ] ]
				].

			 ].
		html mdlDialogActions: [ 
			html mdlButton
				beSubmit;
				callback: [ self session model storeObject: newContact ];
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderDialog: html withModel: aModel [

	| contactTable formWiev contact selected |
	"self halt."
	Transcript
		show: aModel gewerblich asString;
		cr.
	aModel gewerblich
		ifTrue: [ selected := 'gewerblich' ]
		ifFalse: [ selected := 'privat' ].
	Transcript
		show: selected value asString;
		cr.
	html form: [ 
		html mdlDialogTitle: self labelContact.
		html mdlDialogContent: [ 
			html div: [ 
				html render: ((MDLSelectWidget
						  possibilities: #( 'gewerblich' 'privat' )
						  inputLabel: self labelGewerblich
						  labelBlock: #asString
						  callback: [ :input | 
							  selected := input.
							  selected value = 'gewerblich'
								  ifTrue: [ aModel gewerblich: true ]
								  ifFalse: [ aModel gewerblich: false ] ]
						  selectedObject: selected
						  tooltip: tooltipSelectGewerblich)
						 customizationBlock: [ :textField :renderer | 
							 textField onChange:
									 (html jQuery ajax serializeThis onComplete:
											  ((html jQuery id: 'frmContent') load html: [ :canvas | 
													   canvas render: (ASDHMFormKontakt withModel: aModel) ])) ];
						 yourself) ].
			html div
				id: 'frmContent';
				with: [ html render: (ASDHMFormKontakt withModel: aModel) ] ].
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: (html jQuery ajax
						 serializeForm;
						 callback: [ "serializeForm;"
							 self session model storeObject: aModel.
							 contactTable := ASDHMObjectViewTableContactComponent 
								                 withList: self session model contacts ];
						 onComplete: ((html jQuery id: #tableDiv) load
								  html: [ :ajaxHtml | ajaxHtml render: contactTable ];
								  onComplete: 'componentHandler.upgradeElements(this);' js));
				with: 'Ok'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderDialogMenu: html [

	| newContact |
	newContact := ASDHMContact gewerblicherKontakt: false.
	html mdlAnchorButton
		icon;
		id: html nextId;
		openDialogWithId: self rootDialogOpenId;
		onClickUpdateRootDialogWith: [ :r | 
			self renderDialog: r withModel: newContact ];
		with: [ html mdlIcon: 'add' ]
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderDialogSelectbox: html [

	| newContact |
	newContact := ASDHMContact new.
	html form: [ 
		html mdlDialogTitle: self labelAddContact.
		html mdlDialogContent: [ 
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelDisplayString.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact displayName: input ] ].
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelAnrede.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact anrede: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTitle.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact title: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelVorname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact vorname: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelNachname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact nachname: input ] ] ].
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTelefonNr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact telefonNummer: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelMobileFunkNr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact mobilFunkNr: input ] ].
				html mdlTextFieldContainer with: [ "floatingLabel;"
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelEmail.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | newContact email: input ] ] ] ].
		html mdlDialogActions: [ 
			html mdlButton
				beSubmit;
				callback: [ self session model storeObject: newContact ];
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderInnerContentOn: html [

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
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelDisplayString.

							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelDisplayStringAdress.
						"		
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelDisplayStringBank."
								
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelDisplayStringKommunikation.

							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelEdit ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				list doWithIndex: [ :each :index | 
					html tableRow: [ 
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each displayString.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with:
								each str , ' ' , each hsnr , ' ' , each plz , ' ' , each ort.
	"							
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each iban , ' ' , each bic , ' ' , each bankName , ' '
								, each kontoInhaber.
								"
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with:
								each telefonNummer , ' ' , each mobilFunkNr , ' ' , each email.

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

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> tooltipSelectGewerblich [

	^ tooltipSelectGewerblich
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> tooltipSelectGewerblich: anObject [

	tooltipSelectGewerblich := anObject
]
