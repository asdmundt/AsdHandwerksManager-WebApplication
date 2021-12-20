Class {
	#name : #ASDHMFormKontakt,
	#superclass : #ASDHMFormSuperContact,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initalize }
ASDHMFormKontakt >> initialize [

	super initialize.
	self id: 'contactFormCard'.

]

{ #category : #rendering }
ASDHMFormKontakt >> renderBezOn: html [
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
ASDHMFormKontakt >> renderContentOn: html [

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
ASDHMFormKontakt >> renderFieldsOn: html [

	self renderBezOn: html.
	self renderAnredeOn: html.
	self renderTitleOn: html.
	self renderVornameOn: html.
	self renderNachnameOn: html
]

{ #category : #rendering }
ASDHMFormKontakt >> renderFormContentOn: html [
	self renderFieldsOn: html.

]
