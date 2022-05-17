Class {
	#name : #ASDHMFormSuperContact,
	#superclass : #ASDForm,
	#instVars : [
		'title',
		'labelAnrede',
		'labelTitle',
		'labelVorname',
		'labelNachname',
		'labelBez',
		'adressForm',
		'bankForm',
		'kommunikationForm',
		'labeladress',
		'labelBank',
		'labelWaehleEinheit',
		'labelFirmenName',
		'labelAnsprechPartner'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #accessing }
ASDHMFormSuperContact class >> componentTitle [

	^ 'Kontakte'
]

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
	self labelFirmenName: 'Name der Firma'.
	self labelAnsprechPartner: 'Verantwortlicher'
]

{ #category : #accessing }
ASDHMFormSuperContact >> kommunikationForm [

	^ kommunikationForm
]

{ #category : #accessing }
ASDHMFormSuperContact >> kommunikationForm: anObject [

	kommunikationForm := anObject
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
ASDHMFormSuperContact >> labelAnsprechPartner [

	^ labelAnsprechPartner
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelAnsprechPartner: anObject [

	labelAnsprechPartner := anObject
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

{ #category : #rendering }
ASDHMFormSuperContact >> labelFirmenName [

	^ labelFirmenName
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelFirmenName: anObject [

	labelFirmenName := anObject
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
ASDHMFormSuperContact >> labelWaehleEinheit [

	^ labelWaehleEinheit
]

{ #category : #accessing }
ASDHMFormSuperContact >> labelWaehleEinheit: anObject [

	labelWaehleEinheit := anObject
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
ASDHMFormSuperContact >> renderAdressFormAndKommuFormContentOn: html [

	html render:
		(ASDHMFormAdresse withModel: self model andPanel: false) yourself.
	html render: (ASDHMFormKommunikation withModel: self model andPanel: false) yourself
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderAnredeOn: html [

	"html render: (MDLSelectWidget
			 possibilities: #( 'Frau' 'Herr' )
			 inputLabel: self labelAnrede
			 labelBlock: #asString
			 callback: [ :input | self model anrede: input ]
			 selectedObject: self model anrede
			 tooltip: self labelAnrede
			 sortBlock: [ :a :b | a <= b ]) yourself"

	html mdlTextFieldContainer
		style: 'width: 80px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelAnrede.
			html mdlTextFieldInput
				id: html lastId;
				style: 'width: 80px';
				callback: [ :aString | self model anrede: aString ];
				value: self model anrede ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderBezOn: html [

	html mdlTextFieldContainer
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

	self withPanel
		ifTrue: [ 
			html mdlExpansionPanel
				shadow: 2;
				expand;
				"Optional, this is the default."with: [ 
					html mdlExpansionPanelHeader
						toggleExpansionOnClick;
						with: [ 
							html mdlExpansionPanelHeaderTitle: self labelSelf.
							html mdlExpansionPanelHeaderIcon ].
					html mdlExpansionPanelContent: [ super renderContentOn: html ] ] ]
		ifFalse: [ super renderContentOn: html ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormSuperContact >> renderNachnameOn: html [

	html mdlTextFieldContainer
		style: 'width: 150px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelNachname.
			html mdlTextFieldInput
				id: html lastId;
				style: 'width: 150px';
				value: self model nachname;
				callback: [ :aString | self model nachname: aString ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderTitleOn: html [

	html mdlTextFieldContainer
		style: 'width:50px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelTitle.
			html mdlTextFieldInput
				id: html lastId;
				style: 'width: 50px';
				value: self model title;
				callback: [ :aString | self model title: aString ] ]
]

{ #category : #rendering }
ASDHMFormSuperContact >> renderVornameOn: html [

	html mdlTextFieldContainer
		style: 'width: 120px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelVorname.
			html mdlTextFieldInput
				style: 'width: 120px';
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
