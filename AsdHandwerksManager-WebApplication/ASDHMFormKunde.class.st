Class {
	#name : #ASDHMFormKunde,
	#superclass : #ASDForm,
	#instVars : [
		'labelGewerblichInput',
		'formContact',
		'formFirma',
		'labelBez',
		'dictGewerblich',
		'dictPrivat',
		'title'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #accessing }
ASDHMFormKunde >> dictGewerblich [

	^ dictGewerblich
]

{ #category : #accessing }
ASDHMFormKunde >> dictGewerblich: anObject [

	dictGewerblich := anObject
]

{ #category : #accessing }
ASDHMFormKunde >> dictPrivat [

	^ dictPrivat
]

{ #category : #accessing }
ASDHMFormKunde >> dictPrivat: anObject [

	dictPrivat := anObject
]

{ #category : #accessing }
ASDHMFormKunde >> formContact [

	^ formContact
]

{ #category : #accessing }
ASDHMFormKunde >> formContact: anObject [

	formContact := anObject
]

{ #category : #accessing }
ASDHMFormKunde >> formFirma [

	^ formFirma
]

{ #category : #accessing }
ASDHMFormKunde >> formFirma: anObject [

	formFirma := anObject
]

{ #category : #initalize }
ASDHMFormKunde >> initialize [

	super initialize.
	self id: #kundeForm.
	self title: 'Kunde ' , self labelAction
]

{ #category : #accessing }
ASDHMFormKunde >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMFormKunde >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMFormKunde >> labelGewerblichInput [

	^ labelGewerblichInput
]

{ #category : #accessing }
ASDHMFormKunde >> labelGewerblichInput: anObject [

	labelGewerblichInput := anObject
]

{ #category : #rendering }
ASDHMFormKunde >> renderBezOn: html [
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
ASDHMFormKunde >> renderContentOn: html [
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
ASDHMFormKunde >> renderFieldsOn: html [
	self renderBezOn: html.
	self renderStrOn: html.
	self renderHsnrOn: html.
	self renderPlzOn: html.
	self renderOrtOn: html.
	
]

{ #category : #rendering }
ASDHMFormKunde >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormKunde >> renderGewerblichOn: html [

	| selected |
	html div
		id: 'selectWithAjaxId';
		with: 'Selected object: 3'.
	html form: [ 
		html render: ((MDLSelectWidget
				  possibilities: #( 1 2 3 4 5 )
				  inputLabel: 'Select Your Number'
				  labelBlock: #asString
				beAutoSubmit
				  callback: [ :input | selected := input ]
				  selectedObject: 3
				  tooltip: 'description'
				  sortBlock: [ :a :b | a <= b ])
				 entryTooltip: [ :number | 'Choose number: ' , number asString ];
				 customizationBlock: [ :textField :renderer | 
					 textField onChange: (html jQuery ajax serializeThis onComplete:
									  ((html jQuery id: 'selectWithAjaxId') load html: [ :canvas | 
											   canvas text: 'Selected object: ' , selected asString ])) ];
				 yourself) ]
]

{ #category : #rendering }
ASDHMFormKunde >> renderHsnrOn: html [
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
ASDHMFormKunde >> renderOrtOn: html [
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
ASDHMFormKunde >> renderPlzOn: html [
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
ASDHMFormKunde >> renderStrOn: html [
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
ASDHMFormKunde >> title [

	^ title
]

{ #category : #accessing }
ASDHMFormKunde >> title: anObject [

	title := anObject
]
