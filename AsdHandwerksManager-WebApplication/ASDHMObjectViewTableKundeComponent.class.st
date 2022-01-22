Class {
	#name : #ASDHMObjectViewTableKundeComponent,
	#superclass : #ASDHMObjectViewTableComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTableKundeComponent >> initialize [

	super initialize.
	self labelBez: 'Kunde'.
	self labelDisplayString: 'Name'.
	self labelAnrede: 'Anrede'.
	self labelTitle: 'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.
	self labelTelefonNr: 'Telefon Nr.'.
	self labelMobileFunkNr: 'Mobil Funk Nr.'.
	self labelEmail: 'Email'.

	self labeBankverbindungen: 'Bankverbindungen'.
	self labelAdresse: 'Adressen'
]

{ #category : #rendering }
ASDHMObjectViewTableKundeComponent >> renderAddDialog: html [

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
ASDHMObjectViewTableKundeComponent >> renderDialog: html withModel: aModel [

	html form: [ 
		html mdlDialogTitle: self labelAddContact.
		html mdlDialogContent: [ 
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelDisplayString.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | aModel displayName: input ] ].
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelAnrede.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel anrede: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTitle.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel title: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelVorname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel vorname: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelNachname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel nachname: input ] ] ].
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTelefonNr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel telefonNummer: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelMobileFunkNr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel mobilFunkNr: input ] ].
				html mdlTextFieldContainer with: [ "floatingLabel;"
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelEmail.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel email: input ] ] ] ].
		html mdlDialogActions: [ 
			html mdlButton
				beSubmit;
				callback: [ self session model storeObject: aModel ];
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableKundeComponent >> renderDialogMenu: html [
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
ASDHMObjectViewTableKundeComponent >> renderInnerContentOn: html [

	html mdlTable
		shadow: 0;
		style: 'height: 400px;';
				with: [ 
			html tableHead: [ 
					html tableRow
						style: 'background-color: #161b22; ';
						with: [ 
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 10px;';
								with: self labelDisplayString.

							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 10px;';
								with: self labelEmail.
							html mdlTableHeading
								nonNumerical;
								style:
									'background-color: #161b22; position: relativ; top: 10px;';
								with: self labelTelefonNr ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				list doWithIndex: [ :each :index | 
					html tableRow: [ 
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each displayName.

						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each email.
						html mdlTableCell
							nonNumerical;
							style: 'background-color: #0d1117;';
							with: each telefonNummer ] ] ] ]
]
