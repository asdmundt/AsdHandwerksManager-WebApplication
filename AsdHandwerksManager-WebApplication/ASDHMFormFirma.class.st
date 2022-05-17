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
		'umsatzSteuerLabel',
		'geschaeftsFuehrerLabel',
		'title',
		'adressForm',
		'bankForm'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #accessing }
ASDHMFormFirma class >> componentTitle [

	^ 'Firma'
]

{ #category : #accessing }
ASDHMFormFirma >> adressForm [

	^ adressForm
]

{ #category : #accessing }
ASDHMFormFirma >> adressForm: anObject [

	adressForm := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> amtsgerichtSitzLabel [

	^ amtsgerichtSitzLabel
]

{ #category : #accessing }
ASDHMFormFirma >> amtsgerichtSitzLabel: anObject [

	amtsgerichtSitzLabel := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> bankForm [

	^ bankForm
]

{ #category : #accessing }
ASDHMFormFirma >> bankForm: anObject [

	bankForm := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> firmenFormLabel [

	^ firmenFormLabel
]

{ #category : #accessing }
ASDHMFormFirma >> firmenFormLabel: anObject [

	firmenFormLabel := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> firmenSitzLabel [

	^ firmenSitzLabel
]

{ #category : #accessing }
ASDHMFormFirma >> firmenSitzLabel: anObject [

	firmenSitzLabel := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> geschaeftsFuehrerLabel [

	^ geschaeftsFuehrerLabel
]

{ #category : #accessing }
ASDHMFormFirma >> geschaeftsFuehrerLabel: anObject [

	geschaeftsFuehrerLabel := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> hreLabel [

	^ hreLabel
]

{ #category : #accessing }
ASDHMFormFirma >> hreLabel: anObject [

	hreLabel := anObject
]

{ #category : #initalize }
ASDHMFormFirma >> initialize [

	super initialize.
	self id: #firmaForm.
	self title: 'Firma ' , self labelAction.
	self labelSelf: 'Firma'
]

{ #category : #accessing }
ASDHMFormFirma >> nameLabel [

	^ nameLabel
]

{ #category : #accessing }
ASDHMFormFirma >> nameLabel: anObject [

	nameLabel := anObject
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

	self withPanel
		ifTrue: [ 
			html mdlExpansionPanel
				shadow: 0;
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

{ #category : #accessing }
ASDHMFormFirma >> steuerNrLabel [

	^ steuerNrLabel
]

{ #category : #accessing }
ASDHMFormFirma >> steuerNrLabel: anObject [

	steuerNrLabel := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> title [

	^ title
]

{ #category : #accessing }
ASDHMFormFirma >> title: anObject [

	title := anObject
]

{ #category : #accessing }
ASDHMFormFirma >> umsatzSteuerLabel [

	^ umsatzSteuerLabel
]

{ #category : #accessing }
ASDHMFormFirma >> umsatzSteuerLabel: anObject [

	umsatzSteuerLabel := anObject
]
