Class {
	#name : #ASDHMFormKontakt,
	#superclass : #ASDHMFormSuperContact,
	#instVars : [
		'labelFirmenName',
		'labelAnsprechPartner'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #initalize }
ASDHMFormKontakt >> initialize [

	super initialize.
	self id: 'contactFormCard'.
	self title: 'Kontakt ', self labelAction.
]

{ #category : #accessing }
ASDHMFormKontakt >> labelAnsprechPartner [

	^ labelAnsprechPartner
]

{ #category : #accessing }
ASDHMFormKontakt >> labelAnsprechPartner: anObject [

	labelAnsprechPartner := anObject
]

{ #category : #accessing }
ASDHMFormKontakt >> labelFirmenName [

	^ labelFirmenName
]

{ #category : #accessing }
ASDHMFormKontakt >> labelFirmenName: anObject [

	labelFirmenName := anObject
]

{ #category : #rendering }
ASDHMFormKontakt >> renderAnsprechPartnerOn: html [

	html mdlTextFieldContainer with: [ 
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
	self renderAnredeOn: html.
	self renderTitleOn: html.
	self renderVornameOn: html.
	self renderNachnameOn: html
]

{ #category : #rendering }
ASDHMFormKontakt >> renderFirmenNameOn: html [

	html mdlTextFieldContainer with: [ 
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

{ #category : #rendering }
ASDHMFormKontakt >> renderTabContentOn: html [

		| famillies |
	famillies := OrderedDictionary
		with: 'Starks' 		-> #('Eddard' 'Catelyn' 'Robb' 'Sansa' 'Brandon' 'Rickon' 'Arya')
		with: 'Lanisters' 	-> #('Tywin' 'Cersei' 'Jamie' 'Tyrion')
		with: 'Targaryens' 	-> #('Viserys' 'Daenerys').
	html
		mdlTabs: [ html mdlTabBar
				rippleEffect;
				with: [ famillies
						keysDo: [ :familly | 
							html mdlTab
								isActiveIf: familly = 'Starks';
								url: '#' , familly;
								with: familly ] ].
			famillies
				keysAndValuesDo: [ :familly :members | 
					html mdlTabsPanel
						isActiveIf: familly = 'Starks';
						id: familly;
						with: [ html unorderedList: [ members do: [ :member | html listItem: member ] ] ] ] ]
]
