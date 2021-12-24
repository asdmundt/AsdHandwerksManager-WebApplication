Class {
	#name : #ASDHMObjectViewTableContactComponent,
	#superclass : #ASDHMObjectViewTableComponent,
	#instVars : [
		'labelDisplayString',
		'labelAnrede',
		'labelTitle',
		'labelVorname',
		'labelNachname',
		'labelEmail',
		'labelTelefonNr',
		'labelMobileFunkNr',
		'labelAdresse',
		'labelAddContact',
		'labeBankverbindungen',
		'labelBez'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTableContactComponent >> initialize [

	super initialize.
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
ASDHMObjectViewTableContactComponent >> labeBankverbindungen [

	^ labeBankverbindungen
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labeBankverbindungen: anObject [

	labeBankverbindungen := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelAddContact [

	^ labelAddContact
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelAddContact: anObject [

	labelAddContact := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelAdresse [

	^ labelAdresse
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelAdresse: anObject [

	labelAdresse := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelAnrede [

	^ labelAnrede
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelAnrede: anObject [

	labelAnrede := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelDisplayString [

	^ labelDisplayString
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelDisplayString: anObject [

	labelDisplayString := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelMobileFunkNr [

	^ labelMobileFunkNr
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelMobileFunkNr: anObject [

	labelMobileFunkNr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelNachname [

	^ labelNachname
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelNachname: anObject [

	labelNachname := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelVorname [

	^ labelVorname
]

{ #category : #accessing }
ASDHMObjectViewTableContactComponent >> labelVorname: anObject [

	labelVorname := anObject
]

{ #category : #rendering }
ASDHMObjectViewTableContactComponent >> renderAddDialog: html [

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
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelAnrede.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact anrede: input ] ].
			"floatingLabel;"
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelTitle.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact title: input ] ].
			"floatingLabel;"
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelVorname.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact vorname: input ] ].
			"floatingLabel;"
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelNachname.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact nachname: input ] ].
			"floatingLabel;"
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelTelefonNr.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact telefonNummer: input ] ].
			"floatingLabel;"
			html mdlTextFieldContainer with: [ 
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelMobileFunkNr.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact mobilFunkNr: input ] ].
			"floatingLabel;"
			html mdlTextFieldContainer with: [ "floatingLabel;"
				html mdlTextFieldLabel
					for: html nextId;
					with: self labelEmail.
				html mdlTextFieldInput
					id: html lastId;
					callback: [ :input | newContact email: input ] ] ].
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
		shadow: 2;
		style: 'height: 400px;';
		selectable;
		with: [ 
			html tableHead: [ "html tableRow
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
								with: self labelTelefonNr ]"
					 ].
			html tableBody
				"style: 'overflow: scroll;height: 400px;';"
				with: [ 
					list do: [ :each | 
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
