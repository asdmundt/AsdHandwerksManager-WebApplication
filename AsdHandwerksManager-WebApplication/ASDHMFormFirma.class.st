Class {
	#name : #ASDHMFormFirma,
	#superclass : #ASDForm,
	#instVars : [
		'nameLabel',
		'firmenFormLabel',
		'firmenSitzLabel',
		'amtsgerichtSitzLabel',
		'hreLabel',
		'steuerNrLabel',
		'umsatzSteuerLabel'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initalize }
ASDHMFormFirma >> initialize [
	super initialize.
	self id: #firmaForm.
	self strLabel: 'Strasse'.
	self hsnrLabel: 'Haus Nr.'.
	self plzLabel: 'Plz'.
	self ortLabel: 'Ort'
]

{ #category : #rendering }
ASDHMFormFirma >> renderBezOn: html [
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
ASDHMFormFirma >> renderContentOn: html [
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
ASDHMFormFirma >> renderFieldsOn: html [
	self renderBezOn: html.
	self renderStrOn: html.
	self renderHsnrOn: html.
	self renderPlzOn: html.
	self renderOrtOn: html.
	
]

{ #category : #rendering }
ASDHMFormFirma >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormFirma >> renderHsnrOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Haus Nr.'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model hsnr;
				callback: [ :aString | self model hsnr: aString ] ]
]

{ #category : #rendering }
ASDHMFormFirma >> renderOrtOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self ortLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ort;
				callback: [ :aString | self model ort: aString ] ]
]

{ #category : #rendering }
ASDHMFormFirma >> renderPlzOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Postleitzahl'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model plz;
				callback: [ :aString | self model plz: aString ] ]
]

{ #category : #rendering }
ASDHMFormFirma >> renderStrOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Strasse'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model str;
				callback: [ :aString | self model str: aString ] ]
]
