Class {
	#name : #ASDHMContactComponent,
	#superclass : #ASDHMSuperContactComponent,
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
ASDHMContactComponent >> initialize [

	super initialize.
	self labelAnrede: 'Anrede'.
	self labelTitle: 'Title'.
	self labelVorname: 'Vorname'.
	self labelNachname: 'Nachname'.
	self titlepanelPersonalData: 'Persönliche Daten'
]

{ #category : #accessing }
ASDHMContactComponent >> labelAnrede [

	^ labelAnrede
]

{ #category : #accessing }
ASDHMContactComponent >> labelAnrede: anObject [

	labelAnrede := anObject
]

{ #category : #accessing }
ASDHMContactComponent >> labelNachname [

	^ labelNachname
]

{ #category : #accessing }
ASDHMContactComponent >> labelNachname: anObject [

	labelNachname := anObject
]

{ #category : #accessing }
ASDHMContactComponent >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMContactComponent >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMContactComponent >> labelVorname [

	^ labelVorname
]

{ #category : #accessing }
ASDHMContactComponent >> labelVorname: anObject [

	labelVorname := anObject
]

{ #category : #rendering }
ASDHMContactComponent >> renderInnerContentOn: html [

	self renderPersonalDataPanelOn: html.
	self renderCommunicationDataPanelOn: html.
]

{ #category : #rendering }
ASDHMContactComponent >> renderPersonalDataPanelOn: html [

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
ASDHMContactComponent >> titlepanelPersonalData [

	^ titlepanelPersonalData
]

{ #category : #accessing }
ASDHMContactComponent >> titlepanelPersonalData: anObject [

	titlepanelPersonalData := anObject
]
