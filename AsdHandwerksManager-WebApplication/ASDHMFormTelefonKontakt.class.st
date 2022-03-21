Class {
	#name : #ASDHMFormTelefonKontakt,
	#superclass : #ASDHMFormSuperContact,
	#instVars : [
		'labelDisplayString'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #initalize }
ASDHMFormTelefonKontakt >> initialize [

	super initialize.
	self id: 'contactFormCard'.
	self title: 'TelefonKontakt'
]

{ #category : #accessing }
ASDHMFormTelefonKontakt >> labelDisplayString [

	^ labelDisplayString
]

{ #category : #accessing }
ASDHMFormTelefonKontakt >> labelDisplayString: anObject [

	labelDisplayString := anObject
]

{ #category : #rendering }
ASDHMFormTelefonKontakt >> renderBezOn: html [
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
ASDHMFormTelefonKontakt >> renderContentOn: html [

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
ASDHMFormTelefonKontakt >> renderDisplayStringOn: html [

	html mdlTextFieldContainer
		floatingLabel;
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: self labelDisplayString.
			html mdlTextFieldInput
				id: html lastId;
				value: self model displayString;
				callback: [ :aString | self model displayString: aString ] ]
]

{ #category : #rendering }
ASDHMFormTelefonKontakt >> renderFieldsOn: html [

	self renderDisplayStringOn: html.
	html span: [ 
		self renderEmailOn: html.
		self renderTelefonNrOn: html.
		 ]
]

{ #category : #rendering }
ASDHMFormTelefonKontakt >> renderFormContentOn: html [
	self renderFieldsOn: html.

]
