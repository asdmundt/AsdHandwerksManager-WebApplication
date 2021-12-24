Class {
	#name : #ASDHMSuperContactView,
	#superclass : #ASDHMObjectViewComponent,
	#instVars : [
		'labelTelefonNr',
		'labelMobilfunkNr',
		'labelEmail',
		'labelFieldset'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initalize }
ASDHMSuperContactView >> initialize [

	super initialize.
	self labelTelefonNr: 'Telefon Nr.'.
	self labelMobilfunkNr: 'Mobil Funk Nr.'.
	self labelEmail: 'Email'.
	self labelFieldset: 'Kommunikation'
]

{ #category : #accessing }
ASDHMSuperContactView >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMSuperContactView >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMSuperContactView >> labelFieldset [

	^ labelFieldset
]

{ #category : #accessing }
ASDHMSuperContactView >> labelFieldset: anObject [

	labelFieldset := anObject
]

{ #category : #accessing }
ASDHMSuperContactView >> labelMobilfunkNr [

	^ labelMobilfunkNr
]

{ #category : #accessing }
ASDHMSuperContactView >> labelMobilfunkNr: anObject [

	labelMobilfunkNr := anObject
]

{ #category : #accessing }
ASDHMSuperContactView >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMSuperContactView >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #rendering }
ASDHMSuperContactView >> renderBezOn: html [
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
ASDHMSuperContactView >> renderCommunicationDataPanelOn: html [

	html fieldSet
		legend: self labelFieldset;
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

{ #category : #rendering }
ASDHMSuperContactView >> renderFieldsOn: html [
	self renderBezOn: html.
	self renderStrOn: html.
	self renderHsnrOn: html.
	self renderPlzOn: html.
	self renderOrtOn: html.
	
]

{ #category : #rendering }
ASDHMSuperContactView >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #rendering }
ASDHMSuperContactView >> renderHsnrOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Haus Nr.'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model hsnr;
				callback: [ :aString | self model hsnr: aString ] ]
]

{ #category : #rendering }
ASDHMSuperContactView >> renderOrtOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: self ortLabel.
			html mdlTextFieldInput
				id: html lastId;
				value: self model ort;
				callback: [ :aString | self model ort: aString ] ]
]

{ #category : #rendering }
ASDHMSuperContactView >> renderPlzOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Postleitzahl'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model plz;
				callback: [ :aString | self model plz: aString ] ]
]

{ #category : #rendering }
ASDHMSuperContactView >> renderStrOn: html [
	html mdlTextFieldContainer
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: html nextId;
				with: 'Strasse'.
			html mdlTextFieldInput
				id: html lastId;

				value: self model str;
				callback: [ :aString | self model str: aString ] ]
]
