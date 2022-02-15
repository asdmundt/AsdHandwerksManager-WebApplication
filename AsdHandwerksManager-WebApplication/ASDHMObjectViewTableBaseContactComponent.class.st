Class {
	#name : #ASDHMObjectViewTableBaseContactComponent,
	#superclass : #ASDHMObjectViewTableBaseComponent,
	#instVars : [
		'list',
		'labelDisplayString',
		'labelAnrede',
		'labelTitle',
		'labelVorname',
		'labelNachname',
		'labelEmail',
		'labelTelefonNr',
		'labelMobileFunkNr',
		'labelStr',
		'labelHsnr',
		'labelPlz',
		'labelOrt',
		'labeBankverbindungen',
		'labelPersoenlicheDaten',
		'labelKommunikation',
		'labelaktionen',
		'labelAddContact'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMObjectViewTableBaseContactComponent class >> withList: aList [
^ self new list: aList

	
]

{ #category : #initialization }
ASDHMObjectViewTableBaseContactComponent >> initialize [

	super initialize.
	self labelKommunikation: 'Kommunikation'.
	self labeBankverbindungen: 'Bankverbindungen'.
	self labelPersoenlicheDaten: 'Persönliche Daten'.
	self labelStr: 'Strasse'.
	self labelHsnr: 'Haus Nr.'.
	self labelPlz: 'Postleitzahl'.
	self labelOrt: 'Ort'.
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labeBankverbindungen [

	^ labeBankverbindungen
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labeBankverbindungen: anObject [

	labeBankverbindungen := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelAddContact [

	^ labelAddContact
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelAddContact: anObject [

	labelAddContact := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelAnrede [

	^ labelAnrede
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelAnrede: anObject [

	labelAnrede := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayString [

	^ labelDisplayString
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayString: anObject [

	labelDisplayString := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelHsnr [

	^ labelHsnr
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelHsnr: anObject [

	labelHsnr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelKommunikation [

	^ labelKommunikation
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelKommunikation: anObject [

	labelKommunikation := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelMobileFunkNr [

	^ labelMobileFunkNr
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelMobileFunkNr: anObject [

	labelMobileFunkNr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelNachname [

	^ labelNachname
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelNachname: anObject [

	labelNachname := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelOrt [

	^ labelOrt
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelOrt: anObject [

	labelOrt := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelPersoenlicheDaten [

	^ labelPersoenlicheDaten
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelPersoenlicheDaten: anObject [

	labelPersoenlicheDaten := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelPlz [

	^ labelPlz
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelPlz: anObject [

	labelPlz := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelStr [

	^ labelStr
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelStr: anObject [

	labelStr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelView [

	^ labelView
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelView: anObject [

	labelView := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelVorname [

	^ labelVorname
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelVorname: anObject [

	labelVorname := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelaktionen [

	^ labelaktionen
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelaktionen: anObject [

	labelaktionen := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> list [

	^ list
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> list: anObject [

	list := anObject
]

{ #category : #actions }
ASDHMObjectViewTableBaseContactComponent >> remove: anObject [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderAddDialog: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderAddressFields: html withModel: aModel [
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelStr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel str: input ];
						value: aModel str.
						 ] .
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelHsnr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel hsnr: input ];
						value: aModel hsnr.
						 ] .
				html mdlTextFieldContainer with: [ "floatingLabel;"
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelPlz.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel plz: input ];
						value: aModel plz.
						  ].
					html mdlTextFieldContainer with: [ "floatingLabel;"
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelOrt.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel ort: input ];
						value: aModel ort.
						  ]
					 ]
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderBezOn: html [

	html text: self labelBez 
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderDialogMenu: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderKommunicationsFields: html withModel: aModel [
			html span: [ 
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelTelefonNr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel telefonNummer: input ];
						value: aModel telefonNummer ].
				html mdlTextFieldContainer with: [ 
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelMobileFunkNr.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel mobilFunkNr: input ];
						value: aModel mobilFunkNr ].
				html mdlTextFieldContainer with: [ "floatingLabel;"
					html mdlTextFieldLabel
						for: html nextId;
						with: self labelEmail.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | aModel email: input ];
						value: aModel email ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderTableHeadingActions: html [

	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelView.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelEdit.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelDelete.		
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelSelect 
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderTableHeadingAddressData: html [

	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelStr.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelHsnr.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelPlz.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelOrt.
		

]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderTableHeadingCommunnikationsData: html [

	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelTelefonNr.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelMobileFunkNr.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelEmail.

]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderTableHeadingPersonalData: html [

	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelView.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelEdit.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelDelete.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelSelect
]
