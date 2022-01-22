Class {
	#name : #ASDHMFormSuperContact,
	#superclass : #ASDForm,
	#instVars : [
		'labelTelefonNr',
		'labelMobilfunkNr',
		'labelEmail',
		'title',
		'labelAnrede',
		'labelTitle',
		'labelVorname',
		'labelNachname',
		'labelBez',
		'adressForm',
		'bankForm',
		'labeladress',
		'labelBank'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #accessing }
ASDHMFormSuperContact >> adressForm [

	^ adressForm
]

{ #category : #accessing }
ASDHMFormSuperContact >> adressForm: anObject [

	adressForm := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> bankForm [

	^ bankForm
]

{ #category : #accessing }
ASDHMFormSuperContact >> bankForm: anObject [

	bankForm := anObject
]

{ #category : #initalize }
ASDHMFormSuperContact >> initialize [

	super initialize.
	self labeladress: 'Adressen'.
	self labelBank: 'Bankverbindungen'.
	self labelAnrede: 'Anrede'.
	self labelTitle: 'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.
	self labelTelefonNr: 'Telefon Nr.'.
	self labelMobilfunkNr: 'Mobilfunk Nr.'.
	self labelEmail: 'Email'
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelAnrede [

	^ labelAnrede
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelAnrede: anObject [

	labelAnrede := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelBank [

	^ labelBank
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelBank: anObject [

	labelBank := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelMobilfunkNr [

	^ labelMobilfunkNr
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelMobilfunkNr: anObject [

	labelMobilfunkNr := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelNachname [

	^ labelNachname
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelNachname: anObject [

	labelNachname := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelVorname [

	^ labelVorname
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelVorname: anObject [

	labelVorname := anObject
]

{ #category : #accessing }
ASDHMFormSuperContact >> labeladress [

	^ labeladress
]

{ #category : #accessing }
ASDHMFormSuperContact >> labeladress: anObject [

	labeladress := anObject
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderAnredeOn: html [

	html mdlTextFieldContainer
		floatingLabel;
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelAnrede.
			html mdlTextFieldInput
				id: html lastId;
				size: 4;
				value: self model anrede;
				callback: [ :aString | self model anrede: aString ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderBezOn: html [

	html mdlTextFieldContainer
		floatingLabel;
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelBez.
			html mdlTextFieldInput
				id: html lastId;
				value: self model bez;
				callback: [ :aString | self model bez: aString ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderContentOn: html [
self withCard ifTrue:  [  
	html mdlCard
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 500px;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Shop anlegen' level: 2 ].
			html mdlCardTextContainer
				id: html nextId;
				with: [ super renderContentOn: html ] ]]
		ifFalse: [ super renderContentOn: html ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderEmailOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelEmail.
		html mdlTextFieldInput
			id: html lastId;
			callback: [ :input | self model email: input ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormSuperContact >> renderMobileFunkNrOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelMobilfunkNr.
		html mdlTextFieldInput
			id: html lastId;
			callback: [ :input | self model mobilFunkNr: input ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderNachnameOn: html [

	html mdlTextFieldContainer
		floatingLabel;
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelNachname.
			html mdlTextFieldInput
				id: html lastId;
				value: self model nachname;
				callback: [ :aString | self model nachname: aString ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderTelefonNrOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelTelefonNr.
		html mdlTextFieldInput
			id: html lastId;
			callback: [ :input | self model telefonNummer: input ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderTitleOn: html [

	html mdlTextFieldContainer
		floatingLabel;
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelTitle.
			html mdlTextFieldInput
				id: html lastId;
				size: 4;
				value: self model title;
				callback: [ :aString | self model title: aString ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderVornameOn: html [

	html mdlTextFieldContainer
		floatingLabel;
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelVorname.
			html mdlTextFieldInput
				id: html lastId;
				value: self model vorname;
				callback: [ :aString | self model vorname: aString ] ]
]

{ #category : #accessing }
ASDHMFormSuperContact >> title [

	^ title
]

{ #category : #accessing }
ASDHMFormSuperContact >> title: anObject [

	title := anObject
]
