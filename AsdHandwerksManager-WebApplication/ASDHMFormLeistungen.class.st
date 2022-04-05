Class {
	#name : #ASDHMFormLeistungen,
	#superclass : #ASDForm,
	#instVars : [
		'labelBez',
		'labelLeistungsBeschreibung',
		'labelEinheit',
		'labelPreis',
		'labelZeitProEinheit',
		'labelWaehleEinheit',
		'artikelId',
		'labelKategorieKuerzel',
		'kuerzel'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #accessing }
ASDHMFormLeistungen >> artikelId [

	^ artikelId
]

{ #category : #accessing }
ASDHMFormLeistungen >> artikelId: anObject [

	artikelId := anObject
]

{ #category : #initalize }
ASDHMFormLeistungen >> initialize [

	super initialize.
	self id: 'leistungsForm'.
	self labelBez: 'Leistung Titel'.
	self labelLeistungsBeschreibung: 'Leistung Beschreibung'.
	self labelEinheit: 'Einheit'.
	self labelPreis: 'Preis'.
	self labelZeitProEinheit: 'Zeit pro Einheit'.
	self labelKategorieKuerzel: 'Kategorie Kürzel'.
	self labelSelf: 'Leistungen'.
	self labelWaehleEinheit: 'Wähle die Einheit, mit der die Leistung berrechnet wird'.
	self kuerzel: self session kategorieKuerzel
]

{ #category : #accessing }
ASDHMFormLeistungen >> kuerzel [

	^ kuerzel
]

{ #category : #accessing }
ASDHMFormLeistungen >> kuerzel: anObject [

	kuerzel := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelEinheit [

	^ labelEinheit
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelEinheit: anObject [

	labelEinheit := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelKategorieKuerzel [

	^ labelKategorieKuerzel
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelKategorieKuerzel: anObject [

	labelKategorieKuerzel := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelLeistungsBeschreibung [

	^ labelLeistungsBeschreibung
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelLeistungsBeschreibung: anObject [

	labelLeistungsBeschreibung := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelPreis [

	^ labelPreis
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelPreis: anObject [

	labelPreis := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelWaehleEinheit [

	^ labelWaehleEinheit
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelWaehleEinheit: anObject [

	labelWaehleEinheit := anObject
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelZeitProEinheit [

	^ labelZeitProEinheit
]

{ #category : #accessing }
ASDHMFormLeistungen >> labelZeitProEinheit: anObject [

	labelZeitProEinheit := anObject
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderBezOn: html [

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
ASDHMFormLeistungen >> renderContentOn: html [

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
ASDHMFormLeistungen >> renderEinheitOn: html [

	html render: ((MDLSelectWidget
			  possibilities: #( 'Stk' 'm' 'mm' 'qm' )
			  inputLabel: self labelEinheit
			  labelBlock: #asString
			  callback: [ :input | self model einheit: input ]
			  selectedObject: self model einheit
			  tooltip: self labelWaehleEinheit
			  sortBlock: [ :a :b | a <= b ])
			 entryTooltip: [ :number | 
				 self labelWaehleEinheit , ': ' , number asString ];
			 yourself)
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderFieldsOn: html [

	html span: [ 
		html text: self kuerzel.
		html space.
		html space.
		self renderBezOn: html ].
	self renderLeistungsBeschreibungOn: html.
	html span: [ 
		self renderEinheitOn: html.
		self renderPreisOn: html ].
	
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormLeistungen >> renderLeistungsBeschreibungOn: html [

	html mdlTextFieldContainer
		style: 'width: 50px';
		with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelLeistungsBeschreibung.
		html mdlTextArea
			id: html lastId;
			rows: 6;
			value: self model leistungsBeschreibung;
			callback: [ :aString | self model leistungsBeschreibung: aString ] ]
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderPreisOn: html [

	html mdlTextFieldContainer
		style: 'width: 50px';
		with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelPreis.
		html mdlTextFieldInput
			id: html lastId;
			style: 'width: 50px';
			value: self model preis;
			callback: [ :aString | self model preis: aString ] ]
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderZeitProEinheitOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelZeitProEinheit.
		html mdlTextFieldInput
			id: html lastId;
			style: 'width: 150px';
			value: self model zeitProEinheit;
			callback: [ :aString | self model zeitProEinheit: aString ] ]
]
