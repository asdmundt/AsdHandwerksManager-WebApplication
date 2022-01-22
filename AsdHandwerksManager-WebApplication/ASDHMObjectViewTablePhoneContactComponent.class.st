Class {
	#name : #ASDHMObjectViewTablePhoneContactComponent,
	#superclass : #ASDHMObjectViewTableComponent,
	#instVars : [
		'labelAddContact'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTablePhoneContactComponent >> initialize [

	super initialize.
	self labelBez: 'TelefonKontakt'.
	self labelDisplayString: 'Name'.
	self labelAnrede: 'Anrede'.
	self labelTitle: 'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.
	self labelTelefonNr: 'Telefon Nr.'.
	self labelMobileFunkNr: 'Mobil Funk Nr.'.
	self labelEmail: 'Email'.
	self labelAddContact: 'Neuer Kontakt'.
	self labeBankverbindungen: 'Bankverbindungen'.
	self labelAdresse: 'Adressen'
]

{ #category : #accessing }
ASDHMObjectViewTablePhoneContactComponent >> labelAddContact [

	^ labelAddContact
]

{ #category : #accessing }
ASDHMObjectViewTablePhoneContactComponent >> labelAddContact: anObject [

	labelAddContact := anObject
]

{ #category : #rendering }
ASDHMObjectViewTablePhoneContactComponent >> renderAddDialog: html [

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
ASDHMObjectViewTablePhoneContactComponent >> renderDialog: html withModel: aModel [

	| contactTable |
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
						size: 4;
						callback: [ :input | aModel anrede: input ] ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTitle.
					html mdlTextFieldInput
						id: html lastId;
						size: 4;
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
				id: self rootDialogCloseId;
				bePush;
				onClick: (html jQuery ajax
						 serializeForm;
						 script: [ :s | 
							 self session model storeObject: aModel.
							 contactTable := ASDHMObjectViewTableContactComponent 
								                 withList: self session model contacts.

							 s
							 <<
								 ((s jQuery id: #tableDiv) load html: [ :r | 
										  r render: contactTable ]) ]);
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDHMObjectViewTablePhoneContactComponent >> renderDialogMenu: html [
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
ASDHMObjectViewTablePhoneContactComponent >> renderInnerContentOn: html [

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
