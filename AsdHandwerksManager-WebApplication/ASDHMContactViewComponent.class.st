Class {
	#name : #ASDHMContactViewComponent,
	#superclass : #ASDHMObjectViewComponent,
	#instVars : [
		'labelAnrede',
		'labelTitle',
		'labelVorname',
		'labelNachname',
		'titlepanelPersonalData'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMContactViewComponent >> initialize [
	super initialize.
	self labelAnrede: 'Anrede'.
	self labelTitle:  'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelAnrede [

	^ labelAnrede
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelAnrede: anObject [

	labelAnrede := anObject
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelNachname [

	^ labelNachname
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelNachname: anObject [

	labelNachname := anObject
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelVorname [

	^ labelVorname
]

{ #category : #accessing }
ASDHMContactViewComponent >> labelVorname: anObject [

	labelVorname := anObject
]

{ #category : #rendering }
ASDHMContactViewComponent >> renderPersonalDataPanelOn: html [
	html mdlExpansionPanel
		shadow: 0;
		fold;
		with: [ html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				onClick:
					'
	if($(this).parent().hasClass("isFolded")) {
		$(this).find(".mdl-expansion-panel__header-icon").text("expand_less");
		$(this).find(".mdl-expansion-panel__header-description").text("I am folded");
	}
	else {
		$(this).find(".mdl-expansion-panel__header-icon").text("network_wifi");
		$(this).find(".mdl-expansion-panel__header-description").text("I am unfolded");
	}' js;
				with: [ html mdlExpansionPanelHeaderTitle: 'Persönliche Daten'.
					html mdlExpansionPanelHeaderDescription: 'I am folded'.
					html mdlExpansionPanelHeaderIcon: 'network_wifi' ].
			html
				mdlExpansionPanelContent: [	html
		form: [ html mdlTextFieldContainer
				floatingLabel;
				with: [ html mdlTextFieldLabel
						for: html nextId;
						with: self labelAnrede.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | self model anrede: input ] ].
			html mdlTextFieldContainer
				floatingLabel;
				with: [ html mdlTextFieldLabel
						for: html nextId;
						with: self labelTitle.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | self model title: input ] ].
			html mdlTextFieldContainer
				floatingLabel;
				with: [ html mdlTextFieldLabel
						for: html nextId;
						with: self labelVorname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | self model vorname: input ] ].
			html mdlTextFieldContainer
				floatingLabel;
				with: [ html mdlTextFieldLabel
						for: html nextId;
						with: self labelNachname.
					html mdlTextFieldInput
						id: html lastId;
						callback: [ :input | self model nachname: input ] ].
			html mdlButton
				beSubmit;
				callback: [  ];
				with: 'Accept'.
			html mdlButton with: 'Cancel' ]] ]
]
