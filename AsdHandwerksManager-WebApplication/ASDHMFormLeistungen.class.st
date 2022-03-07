Class {
	#name : #ASDHMFormLeistungen,
	#superclass : #ASDForm,
	#instVars : [
		'labelBez',
		'labelLeistungsBeschreibung',
		'labelEinheit',
		'labelPreis',
		'labelZeitProEinheit',
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
	self kuerzel: self session kategorieKuerzel.
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

	self withCard
		ifTrue: [ 
			html mdlCard
				shadow: 0;
				mdlTypographyTextLeft;
				style: 'width: 100%; height: 500px;';
				with: [ 
					html mdlCardTitleContainer with: [ 
							html mdlCardTitleText: self model title level: 2 ].
					html mdlCardTextContainer
						id: html nextId;
						with: [ super renderContentOn: html ] ] ]
		ifFalse: [ super renderContentOn: html ]
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderEinheitOn: html [
	html
				render:
					((MDLSelectWidget
						possibilities: #('Stk' 'm' 'mm' 'qm')
						inputLabel: self labelEinheit 
						labelBlock: #asString
						callback: [ :input | self model einheit: input ]
						selectedObject: self model einheit
						tooltip: 'description'
						sortBlock: [ :a :b | a <= b ])
						entryTooltip: [ :number | 'Choose number: ' , number asString ];
						yourself).
	
	
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderFieldsOn: html [

	html span: [ 
		html text: self kuerzel.
		html space.
		html space.
		self renderBezOn: html.

		 ].
	self renderLeistungsBeschreibungOn: html.
	html span: [ 
		self renderEinheitOn: html.
		self renderPreisOn: html ].
	self renderZeitProEinheitOn: html
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMFormLeistungen >> renderLeistungsBeschreibungOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelLeistungsBeschreibung.
		html mdlTextArea 
			id: html lastId;
			value: self model leistungsBeschreibung;
			callback: [ :aString | self model leistungsBeschreibung: aString ] ]
]

{ #category : #rendering }
ASDHMFormLeistungen >> renderPreisOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelPreis.
		html mdlTextFieldInput
			id: html lastId;
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
			value: self model zeitProEinheit;
			callback: [ :aString | self model zeitProEinheit: aString ] ]
]
