Class {
	#name : #ASDHMFormKommunikation,
	#superclass : #ASDForm,
	#instVars : [
		'labelTelefonNr',
		'labelMobilfunkNr',
		'labelEmail'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #initialization }
ASDHMFormKommunikation >> initialize [

	super initialize.
	self labelSelf: 'Kommunikations Daten'.
	self labelTelefonNr: 'Telefon Nr.'.
	self labelMobilfunkNr: 'Mobilfunk Nr.'.
	self labelEmail: 'Email'
]

{ #category : #accessing }
ASDHMFormKommunikation >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMFormKommunikation >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMFormKommunikation >> labelMobilfunkNr [

	^ labelMobilfunkNr
]

{ #category : #accessing }
ASDHMFormKommunikation >> labelMobilfunkNr: anObject [

	labelMobilfunkNr := anObject
]

{ #category : #accessing }
ASDHMFormKommunikation >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMFormKommunikation >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #rendering }
ASDHMFormKommunikation >> renderContentOn: html [

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
ASDHMFormKommunikation >> renderEmailOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelEmail.
		html mdlTextFieldInput
			id: html lastId;
			callback: [ :input | self model email: input ] ]
]

{ #category : #rendering }
ASDHMFormKommunikation >> renderFieldsOn: html [

	
	self renderTelefonNrOn: html.
	self renderMobileFunkNrOn: html.
	self renderEmailOn: html.
]

{ #category : #rendering }
ASDHMFormKommunikation >> renderMobileFunkNrOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelMobilfunkNr.
		html mdlTextFieldInput
			id: html lastId;
			callback: [ :input | self model mobilFunkNr: input ] ]
]

{ #category : #rendering }
ASDHMFormKommunikation >> renderTelefonNrOn: html [

	html mdlTextFieldContainer with: [ 
		html mdlTextFieldLabel
			for: html nextId;
			with: self labelTelefonNr.
		html mdlTextFieldInput
			id: html lastId;
			callback: [ :input | self model telefonNummer: input ] ]
]