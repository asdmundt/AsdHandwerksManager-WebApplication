Class {
	#name : #ASDHMFormBank,
	#superclass : #ASDForm,
	#instVars : [
		'cancelLabel',
		'submitLabel',
		'bankNameLabel',
		'bicLabel',
		'ibanLabel',
		'kontoInhaberLabel',
		'cancelCallback'
	],
	#category : #'AsdHandwerksManager-WebApplication-forms'
}

{ #category : #rendering }
ASDHMFormBank >> bankNameInputWidget [

	^ MDLTextFieldWidget new
		  style: 'width: 300px';
		  type: 'text';
		  label: bankNameLabel;
		  pattern: '^\S+$' errorMessage: 'kein leerstring';
		  callback: [ :aString | self model bankName: aString ];
		  value: self model bankName
]

{ #category : #accessing }
ASDHMFormBank >> bankNameLabel [

	^ bankNameLabel
]

{ #category : #accessing }
ASDHMFormBank >> bankNameLabel: anObject [

	bankNameLabel := anObject
]

{ #category : #rendering }
ASDHMFormBank >> bicInputWidget [

	^ MDLTextFieldWidget new
		  style: 'width: 200px';
		  type: 'text';
		  label: bicLabel;
		  pattern: '^\S+$' errorMessage: 'kein leerstring';
		  callback: [ :aString | self model bic: aString ];
		  value: self model bic
]

{ #category : #accessing }
ASDHMFormBank >> bicLabel [

	^ bicLabel
]

{ #category : #accessing }
ASDHMFormBank >> bicLabel: anObject [

	bicLabel := anObject
]

{ #category : #accessing }
ASDHMFormBank >> cancelCallback [
	^ cancelCallback
]

{ #category : #accessing }
ASDHMFormBank >> cancelCallback: anObject [
	cancelCallback := anObject
]

{ #category : #accessing }
ASDHMFormBank >> cancelLabel [
	^ cancelLabel
]

{ #category : #accessing }
ASDHMFormBank >> cancelLabel: anObject [
	cancelLabel := anObject
]

{ #category : #rendering }
ASDHMFormBank >> ibanInputWidget [

	^ MDLTextFieldWidget new
		  required: true;
		  type: 'text';
		  label: ibanLabel;
		style: 'width: 350px';
		  pattern: '^\S+$' errorMessage: 'kein leerstring';
		  callback: [ :aString | self model iban: aString ];
		  value: self model iban
]

{ #category : #accessing }
ASDHMFormBank >> ibanLabel [

	^ ibanLabel
]

{ #category : #accessing }
ASDHMFormBank >> ibanLabel: anObject [

	ibanLabel := anObject
]

{ #category : #initalize }
ASDHMFormBank >> initialize [

	super initialize.
	self id: #bankForm.
	self bankNameLabel: 'Bank Name'.
	self bicLabel: 'Bic'.
	self cancelLabel: 'abbrechen'.
	self ibanLabel: 'Iban'.
	self kontoInhaberLabel: 'Konto Inhaber'.
	self labelSelf: 'Bank Daten'.
	self submitLabel: 'ok'
]

{ #category : #rendering }
ASDHMFormBank >> kontoInhaberInputWidget [

	^ MDLTextFieldWidget new
		  id: 'kontoInhaber';
		  type: 'text';
		  label: kontoInhaberLabel;
			style: 'width: 350px';
		  pattern: '^\S+$' errorMessage: 'kein leerstring';
		  callback: [ :aString | self model kontoInhaber: aString ];
		  value: self model kontoInhaber
]

{ #category : #accessing }
ASDHMFormBank >> kontoInhaberLabel [

	^ kontoInhaberLabel
]

{ #category : #accessing }
ASDHMFormBank >> kontoInhaberLabel: anObject [

	kontoInhaberLabel := anObject
]

{ #category : #rendering }
ASDHMFormBank >> renderCancelButtonOn: html [
	html anchor
		class: 'mdl-button mdl-js-button mdl-button--raised';
		callback: cancelCallback;
		with: cancelLabel
]

{ #category : #rendering }
ASDHMFormBank >> renderContentOn: html [

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
ASDHMFormBank >> renderFieldsOn: html [
	html render: self ibanInputWidget.
	html render: self bicInputWidget.
	html render: self bankNameInputWidget.
	html render: self kontoInhaberInputWidget.
	
]

{ #category : #rendering }
ASDHMFormBank >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #accessing }
ASDHMFormBank >> submitLabel [

	^ submitLabel
]

{ #category : #accessing }
ASDHMFormBank >> submitLabel: anObject [

	submitLabel := anObject
]
