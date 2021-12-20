Class {
	#name : #ASDHMContactViewComponent,
	#superclass : #ASDHMSuperContactView,
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
	self labelTitle: 'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.
	self titlepanelPersonalData: 'Persönliche Daten'
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
ASDHMContactViewComponent >> renderInnerContentOn: html [

	self renderPersonalDataPanelOn: html.
	self renderCommunicationDataPanelOn: html.
]

{ #category : #rendering }
ASDHMContactViewComponent >> renderPersonalDataPanelOn: html [

	html fieldSet
		legend: self titlepanelPersonalData;
		with: [ 
			html div: [ 
					html span: [ 
							html paragraph
								script: (html scriptaculous inPlaceEditor
										 cancelControl: 'false';
										 externalControl: #click;
										 submitOnBlur: true;
										 okControl: 'false';
										 triggerInPlaceEditor: [ :valueAnrede | 
											 self model anrede: valueAnrede ];
										 callback: [ :r | r render: self model anrede ]);
								with: self model anrede , ' '.
							html paragraph
								script: (html scriptaculous inPlaceEditor
										 cancelControl: 'false';
										 externalControl: #click;
										 submitOnBlur: true;
										 okControl: 'false';
										 triggerInPlaceEditor: [ :valueTitle | 
											 self model titel: valueTitle ];
										 callback: [ :r | r render: self model titel ]);
								with: self model titel , ' '.
							html paragraph
								script: (html scriptaculous inPlaceEditor
										 cancelControl: 'false';
										 externalControl: #click;
										 submitOnBlur: true;
										 okControl: 'false';
										 triggerInPlaceEditor: [ :valueVorname | 
											 self model titel: valueVorname ];
										 callback: [ :r | r render: self model vorname ]);
								with: self model vorname , ' '.
							html paragraph
								script: (html scriptaculous inPlaceEditor
										 cancelControl: 'false';
										 externalControl: #click;
										 submitOnBlur: true;
										 okControl: 'false';
										 triggerInPlaceEditor: [ :valueNachname | 
											 self model titel: valueNachname ];
										 callback: [ :r | r render: self model nachname ]);
								with: self model nachname ] ] ]
]

{ #category : #accessing }
ASDHMContactViewComponent >> titlepanelPersonalData [

	^ titlepanelPersonalData
]

{ #category : #accessing }
ASDHMContactViewComponent >> titlepanelPersonalData: anObject [

	titlepanelPersonalData := anObject
]
