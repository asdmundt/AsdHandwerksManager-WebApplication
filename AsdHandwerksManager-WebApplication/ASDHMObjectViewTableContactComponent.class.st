Class {
	#name : #ASDHMObjectViewTableContactComponent,
	#superclass : #ASDHMObjectViewTableBaseContactComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTableContactComponent >> initialize [

	super initialize.
	self labelBez: 'Kontakte'.
	self labelDisplayString: 'Name'.
	self labelAnrede: 'Anrede'.
	self labelTitle: 'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.

	self labelAddContact: 'Neuer Kontakt'
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderAddDialog: html [

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

	| contactTable |
	html form: [ 
		html mdlDialogTitle: self labelAddContact.
		html mdlDialogContent: [ 
			
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelAnrede.
					html mdlTextFieldInput
						id: html lastId;
						size: 4;
						callback: [ :input | aModel anrede: input ];
						value: aModel anrede.
						 ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTitle.
					html mdlTextFieldInput
						id: html lastId;
						size: 4;
						callback: [ :input | aModel title: input ];
						value: aModel title.
						 ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelVorname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel vorname: input ];
						value: aModel vorname.
						 ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelNachname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel nachname: input ];
						value: aModel nachname.
						 ] ] .
			self renderAddressFields: html withModel: aModel.	
			self renderKommunicationsFields: html withModel: aModel.
			
			]. 
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: 
								(html jQuery ajax
						serializeForm;
						callback: [ "serializeForm;"
							self session model storeObject: aModel. 
							contactTable := ASDHMObjectViewTableContactComponent 
								                 withList: self session model contacts.
							 ];
						onComplete:
							((html jQuery id: #tableDiv) load
								html: [ :ajaxHtml | ajaxHtml render: contactTable ];
								onComplete: 'componentHandler.upgradeElements(this);' js));
			
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ]  ] 
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderDialogMenu: html [
| newContact |
	newContact := ASDHMContact new.
html mdlAnchorButton
								icon;
								id: html nextId;
								openDialogWithId: self rootDialogOpenId;
								onClickUpdateRootDialogWith: [ :r | self renderDialog: r withModel: newContact ];
								with: [ html mdlIcon: 'add' ].
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
								with: self labelAnrede.

							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelTitle.
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelVorname.
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelNachname.								
							self renderTableHeadingCommunnikationsData: html.
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 0px;';
								with: self labelEdit. ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				list doWithIndex: [ :each :index | 
					html tableRow: [ 
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each anrede.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each title.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each vorname.							
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each nachname.
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
							with: [ html mdlAnchorButton
								icon;
								id: html nextId;
								openDialogWithId: self rootDialogOpenId;
								onClickUpdateRootDialogWith: [ :r | self renderDialog: r withModel: each ];
								with: [ html mdlIcon: 'edit' ]].		
							 ] ] ] ]
]
