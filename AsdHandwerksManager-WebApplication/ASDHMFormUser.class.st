Class {
	#name : #ASDHMFormUser,
	#superclass : #ASDHMFormSuperContact,
	#instVars : [
		'cancelLabel',
		'passwordLabel',
		'nachnameLabel',
		'gmailLabel',
		'benutzerLabel',
		'cancelCallback',
		'vornameLabel',
		'titleLabel',
		'submitLabel',
		'isDialog'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMFormUser >> _renderContentOn: html [
	html
		form: [ self renderFieldsOn: html.
			self isAjax
				ifTrue: [ self renderAjaxButtonOn: html ]
				ifFalse: [ self renderButtonOn: html ] ]
]

{ #category : #accessing }
ASDHMFormUser >> benutzerLabel [
	^ benutzerLabel
]

{ #category : #accessing }
ASDHMFormUser >> benutzerLabel: anObject [
	benutzerLabel := anObject
]

{ #category : #rendering }
ASDHMFormUser >> benutzerNaneInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		
		type: 'text';
		label: benutzerLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model benutzerName: aString ];
		value: self model benutzerName
]

{ #category : #accessing }
ASDHMFormUser >> cancelCallback [
	^ cancelCallback
]

{ #category : #accessing }
ASDHMFormUser >> cancelCallback: anObject [
	cancelCallback := anObject
]

{ #category : #accessing }
ASDHMFormUser >> cancelLabel [
	^ cancelLabel
]

{ #category : #accessing }
ASDHMFormUser >> cancelLabel: anObject [
	cancelLabel := anObject
]

{ #category : #rendering }
ASDHMFormUser >> gmailInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;
		type: 'text';
		label: gmailLabel;
		
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model gmail: aString ];
		value: self model gmail
]

{ #category : #accessing }
ASDHMFormUser >> gmailLabel [
	^ gmailLabel
]

{ #category : #accessing }
ASDHMFormUser >> gmailLabel: anObject [
	gmailLabel := anObject
]

{ #category : #initalize }
ASDHMFormUser >> initialize [
	super initialize.
	self id: 'userFormCard'.
	self titleLabel: 'Benutzer Verwaltung'.
	
	self benutzerLabel: 'Benutzername'.
	self cancelLabel: 'abbrechen'.
	self gmailLabel: 'GMailName'.
	self nachnameLabel: 'Nachname'.
	self passwordLabel: 'Password'.
	self submitLabel: 'ok'.
	self vornameLabel: 'Vorname'.
	self isDialog: false
]

{ #category : #accessing }
ASDHMFormUser >> isDialog [
	^ isDialog
]

{ #category : #accessing }
ASDHMFormUser >> isDialog: anObject [
	isDialog := anObject
]

{ #category : #rendering }
ASDHMFormUser >> nachnameInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;

		type: 'text';
		label: nachnameLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model nachname: aString ];
		value: self model nachname
]

{ #category : #accessing }
ASDHMFormUser >> nachnameLabel [
	^ nachnameLabel
]

{ #category : #accessing }
ASDHMFormUser >> nachnameLabel: anObject [
	nachnameLabel := anObject
]

{ #category : #rendering }
ASDHMFormUser >> passwordInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;

		type: 'password';
		label: passwordLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model password: aString ];
		value: self model password
]

{ #category : #accessing }
ASDHMFormUser >> passwordLabel [
	^ passwordLabel
]

{ #category : #accessing }
ASDHMFormUser >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #rendering }
ASDHMFormUser >> renderCancelButtonOn: html [
	html anchor
		class: 'mdl-button mdl-js-button mdl-button--raised';
		callback: cancelCallback;
		with: cancelLabel
]

{ #category : #rendering }
ASDHMFormUser >> renderContentOn: html [
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
ASDHMFormUser >> renderFieldsOn: html [
	html render: self benutzerNaneInputWidget.
	html render: self passwordInputWidget.
	html render: self vornameInputWidget.
	html render: self nachnameInputWidget.
	
]

{ #category : #rendering }
ASDHMFormUser >> renderFormContentOn: html [
	self renderFieldsOn: html.

]

{ #category : #accessing }
ASDHMFormUser >> submitLabel [
	^ submitLabel
]

{ #category : #accessing }
ASDHMFormUser >> submitLabel: anObject [
	submitLabel := anObject
]

{ #category : #accessing }
ASDHMFormUser >> titleLabel [
	^ titleLabel
]

{ #category : #accessing }
ASDHMFormUser >> titleLabel: anObject [
	titleLabel := anObject
]

{ #category : #rendering }
ASDHMFormUser >> vornameInputWidget [
	^ MDLTextFieldWidget new
		beFloatingLabel;

		type: 'text';
		label: vornameLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		callback: [ :aString | self model vorname: aString ];
		value: self model vorname
]

{ #category : #accessing }
ASDHMFormUser >> vornameLabel [
	^ vornameLabel
]

{ #category : #accessing }
ASDHMFormUser >> vornameLabel: anObject [
	vornameLabel := anObject
]
