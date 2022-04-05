Class {
	#name : #ASDHMFormKontakt,
	#superclass : #ASDHMFormSuperContact,
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #initalize }
ASDHMFormKontakt >> initialize [

	super initialize.
	self id: 'contactFormCard'.
	self title: 'Kontakt '.

]

{ #category : #rendering }
ASDHMFormKontakt >> renderAnsprechPartnerOn: html [

	html mdlTextFieldContainer
		style: 'width: 50px';
		with: [
		html mdlTextFieldLabel
			for: 'ansprechPartner';
			with: self labelAnsprechPartner.
		html mdlTextFieldInput
			id: 'ansprechPartner';
			value: self model ansprechPartner;
			callback: [ :aString | self model ansprechPartner: aString ] ]
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
ASDHMFormKontakt >> renderFieldsOn: html [

	"self renderBezOn: html."

	self model gewerblich
		ifTrue: [ 
			self renderFirmenNameOn: html.
			self renderAnsprechPartnerOn: html ]
		ifFalse: [ 
			html span: [ 
		
			self renderAnredeOn: html.
			self renderTitleOn: html
			].
		html span: [ 
			self renderVornameOn: html.
			self renderNachnameOn: html ] ].
	self renderAdressFormAndKommuFormContentOn: html
]

{ #category : #rendering }
ASDHMFormKontakt >> renderFirmenNameOn: html [

	html mdlTextFieldContainer
		style: 'width: 50px';
		with: [
		html mdlTextFieldLabel
			for: 'firmenName';
			with: self labelFirmenName.
		html mdlTextFieldInput
			id: 'firmenName';
			value: self model firmenName;
			callback: [ :aString | self model firmenName: aString ] ]
]

{ #category : #rendering }
ASDHMFormKontakt >> renderFormContentOn: html [
	self renderFieldsOn: html.

]
