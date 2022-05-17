Class {
	#name : #ASDHMFormAdresse,
	#superclass : #ASDForm,
	#instVars : [
		'strLabel',
		'hsnrLabel',
		'plzLabel',
		'ortLabel'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #'as yet unclassified' }
ASDHMFormAdresse class >> componentTitle [

	^ 'Adresse'
]

{ #category : #accessing }
ASDHMFormAdresse >> hsnrLabel [
	^ hsnrLabel
]

{ #category : #accessing }
ASDHMFormAdresse >> hsnrLabel: anObject [
	hsnrLabel := anObject
]

{ #category : #initalize }
ASDHMFormAdresse >> initialize [

	super initialize.
	self id: #adressForm.
	self strLabel: 'Strasse'.
	self hsnrLabel: 'Haus Nr.'.
	self plzLabel: 'Plz'.
	self ortLabel: 'Ort'.
	self labelSelf: 'Adress Daten'
]

{ #category : #accessing }
ASDHMFormAdresse >> ortLabel [
	^ ortLabel
]

{ #category : #accessing }
ASDHMFormAdresse >> ortLabel: anObject [
	ortLabel := anObject
]

{ #category : #accessing }
ASDHMFormAdresse >> plzLabel [
	^ plzLabel
]

{ #category : #accessing }
ASDHMFormAdresse >> plzLabel: anObject [
	plzLabel := anObject
]

{ #category : #rendering }
ASDHMFormAdresse >> renderBezOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Bez'.
			html mdlTextFieldInput
				id: html lastId;
				
				value: self model bez;
				callback: [ :aString | self model bez: aString ] ]
]

{ #category : #rendering }
ASDHMFormAdresse >> renderContentOn: html [

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
ASDHMFormAdresse >> renderFieldsOn: html [

	"self renderBezOn: html."

	html span: [ 
		self renderStrOn: html.
		self renderHsnrOn: html.
	].
	
		self renderPlzOn: html.
		self renderOrtOn: html 
]

{ #category : #rendering }
ASDHMFormAdresse >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormAdresse >> renderHsnrOn: html [

	html mdlTextFieldContainer
		style: 'width: 50px';
		with: [
		html mdlTextFieldLabel
			for: html nextId;
			with: self hsnrLabel.
		html mdlTextFieldInput
			id: html lastId;
			style: 'width: 50px;';
			value: self model hsnr;
			callback: [ :aString | self model hsnr: aString ] ]
]

{ #category : #rendering }
ASDHMFormAdresse >> renderOrtOn: html [

	html mdlTextFieldContainer
		style: 'width: 100px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self ortLabel.
			html mdlTextFieldInput
				style: 'width: 110px';
				id: html lastId;
				value: self model ort;
				callback: [ :aString | self model ort: aString ] ]
]

{ #category : #rendering }
ASDHMFormAdresse >> renderPlzOn: html [

	html mdlTextFieldContainer
		style: 'width: 100px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self plzLabel.
			html mdlTextFieldInput
				id: html lastId;
				style: 'width: 80px;';
				value: self model plz;
				callback: [ :aString | self model plz: aString ] ]
]

{ #category : #rendering }
ASDHMFormAdresse >> renderStrOn: html [

	html mdlTextFieldContainer
		style: 'width: 200px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: strLabel.
			html mdlTextFieldInput
				style: 'width: 200px';
				id: html lastId;
				value: self model str;
				callback: [ :aString | self model str: aString ] ]
]

{ #category : #accessing }
ASDHMFormAdresse >> strLabel [
	^ strLabel
]

{ #category : #accessing }
ASDHMFormAdresse >> strLabel: anObject [
	strLabel := anObject
]
