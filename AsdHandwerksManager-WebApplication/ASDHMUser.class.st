Class {
	#name : #ASDHMUser,
	#superclass : #ASDHMContact,
	#instVars : [
		'gmail',
		'pwdGmail',
		'password',
		'admin',
		'logged',
		'index',
		'indexLoggedUser',
		'benutzerName',
		'objectId'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #'instance creation' }
ASDHMUser class >> benutzerName: login password: password [
	^ self new
		benutzerName: login;
		password: password;
		yourself
]

{ #category : #'instance creation' }
ASDHMUser class >> benutzerName: login password: password admin: anAdmin [
	^ self new
		benutzerName: login;
		password: password;
		admin: anAdmin;
		yourself
]

{ #category : #voyage }
ASDHMUser class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMUser >> admin [
	^ admin
]

{ #category : #accessing }
ASDHMUser >> admin: anObject [
	admin := anObject
]

{ #category : #accessing }
ASDHMUser >> asAdmin [
	self type: #admin
]

{ #category : #accessing }
ASDHMUser >> asCostumer [
	self type: #costumer
]

{ #category : #accessing }
ASDHMUser >> asEmployee [
	self type: #employee
]

{ #category : #accessing }
ASDHMUser >> benutzerName [
	^ benutzerName
]

{ #category : #accessing }
ASDHMUser >> benutzerName: anObject [
	benutzerName := anObject
]

{ #category : #'magritte descriptions' }
ASDHMUser >> descriptionBenutzerName [
	<magritteDescription>
	^ MAStringDescription new
		priority: 30;
		label: 'Benutzer';
		accessor: #benutzerName;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Benutzernamen eingeben';
		comment: 'Bitte Ihren Benutzernamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDHMUser >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #'magritte descriptions' }
ASDHMUser >> descriptionNachname [
	<magritteDescription>
	^ MAStringDescription new
		priority: 20;
		label: 'Nachname';
		accessor: #nachname;
		beRequired;
		requiredErrorMessage: 'Bitte geben Sie Ihren Nachnamen ein';
		comment: 'Bitte Ihren Nachnamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDHMUser >> descriptionPassword [
	<magritteDescription>
	^ MAStringDescription new
		priority: 40;
		label: 'Password';
		accessor: #password;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Passwort eingeben';
		comment: 'Bitte Ihr Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDHMUser >> descriptionPwdGmail [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Password Gmail';
		accessor: #pwdGmail;
		beRequired;
		requiredErrorMessage: 'Bitte Ihr Gmail Passwort eingeben';
		comment: 'Bitte Ihr Gmail Passwort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
ASDHMUser >> descriptionVorname [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Vorname';
		accessor: #vorname;
		beRequired;
		requiredErrorMessage: 'Bitte Ihren Vornamen eingeben';
		comment: 'Bitte Ihren Vornamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDHMUser >> gmail [
	^ gmail
]

{ #category : #accessing }
ASDHMUser >> gmail: anObject [
	gmail := anObject
]

{ #category : #'magritte descriptions' }
ASDHMUser >> gmailDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Gmail Adr.';
		accessor: #gmail;
		comment: 'bitte Ihre Email Adresse eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDHMUser >> index [
	^ index
]

{ #category : #accessing }
ASDHMUser >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ASDHMUser >> indexLoggedUser [
	^ indexLoggedUser
]

{ #category : #accessing }
ASDHMUser >> indexLoggedUser: anObject [
	indexLoggedUser := anObject
]

{ #category : #initialization }
ASDHMUser >> initialize [
	super initialize.
	self logged: false.
	self admin: false.
	self indexLoggedUser: nil.
	
	
	
]

{ #category : #testing }
ASDHMUser >> isAdmin [ 
^ self admin
]

{ #category : #testing }
ASDHMUser >> isLogged [
	^ self logged
]

{ #category : #accessing }
ASDHMUser >> logged [
	^ logged
]

{ #category : #accessing }
ASDHMUser >> logged: anObject [
	logged := anObject
]

{ #category : #accessing }
ASDHMUser >> password [
	^ password
]

{ #category : #accessing }
ASDHMUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
ASDHMUser >> pwdGmail [
	^ pwdGmail
]

{ #category : #accessing }
ASDHMUser >> pwdGmail: anObject [
	pwdGmail := anObject
]