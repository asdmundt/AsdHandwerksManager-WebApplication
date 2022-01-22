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

	self withCard
		ifTrue: [ 
			html mdlCard
				shadow: 0;
				mdlTypographyTextLeft;
				style: 'width: 100%; height: 500px;';
				with: [ 
					html mdlCardTitleContainer with: [ 
							html mdlCardTitleText: self title level: 2 ].
					html mdlCardTextContainer
						id: html nextId;
						with: [ super renderContentOn: html ] ] ]
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
