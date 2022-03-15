Class {
	#name : #ASDHMFormAuftragNeu,
	#superclass : #ASDForm,
	#instVars : [
		'labelBez',
		'labelBaustellenAddresse',
		'LabelTechnischeBeschreibung'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #initalize }
ASDHMFormAuftragNeu >> initialize [

	super initialize.
	self id: #auftragForm.
	self labelBez: 'Bezeichnung'.
	self labelBez: 'Bezeichnung'.
	self labelBez: 'Bezeichnung'.
]

{ #category : #accessing }
ASDHMFormAuftragNeu >> labelBaustellenAddresse [

	^ labelBaustellenAddresse
]

{ #category : #accessing }
ASDHMFormAuftragNeu >> labelBaustellenAddresse: anObject [

	labelBaustellenAddresse := anObject
]

{ #category : #accessing }
ASDHMFormAuftragNeu >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMFormAuftragNeu >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMFormAuftragNeu >> labelTechnischeBeschreibung [

	^ LabelTechnischeBeschreibung
]

{ #category : #accessing }
ASDHMFormAuftragNeu >> labelTechnischeBeschreibung: anObject [

	LabelTechnischeBeschreibung := anObject
]

{ #category : #rendering }
ASDHMFormAuftragNeu >> renderBezOn: html [

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
ASDHMFormAuftragNeu >> renderContentOn: html [
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
ASDHMFormAuftragNeu >> renderFieldsOn: html [
	self renderBezOn: html.
	self renderStrOn: html.
	self renderHsnrOn: html.
	self renderPlzOn: html.
	self renderOrtOn: html.
	
]

{ #category : #rendering }
ASDHMFormAuftragNeu >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormAuftragNeu >> renderGewerblichOn: html [

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
