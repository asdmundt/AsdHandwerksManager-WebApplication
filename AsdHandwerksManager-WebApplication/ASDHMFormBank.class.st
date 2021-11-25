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
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMFormBank >> bankNameInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		
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
		beFloatingLabel;
		
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
		beFloatingLabel;
		required: true;
		type: 'text';
		label: ibanLabel;
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
	
	self submitLabel: 'ok'.
	
	
]

{ #category : #rendering }
ASDHMFormBank >> kontoInhaberInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		
		type: 'text';
		label: kontoInhaberLabel;
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
self withCard ifTrue:  [  
	html mdlCard
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 500px;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Account' level: 2 ].
			html mdlCardTextContainer
				id: html nextId;
				with: [ super renderContentOn: html ] ]]
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
