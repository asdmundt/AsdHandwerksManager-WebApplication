Class {
	#name : #ASDHMAdresse,
	#superclass : #ASDHMModel,
	#instVars : [
		'str',
		'hsnr',
		'plz',
		'ort',
		'land',
		'tel',
		'bemerkung',
		'objectId'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #'instance creation' }
ASDHMAdresse class >> bez: aBez [
	^ self new
		bez: aBez;
		yourself
]

{ #category : #'instance creation' }
ASDHMAdresse class >> bez: aBez andObjectId: anInteger [ 
	^ self new
		bez: aBez;
		objectId: anInteger;
		yourself
]

{ #category : #voyage }
ASDHMAdresse class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMAdresse >> bemerkung [
	^ bemerkung
]

{ #category : #accessing }
ASDHMAdresse >> bemerkung: anObject [
	bemerkung := anObject
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionBemerkung [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Bemerkung';
		accessor: #bemerkung;
		priority: 8;
		required: false;
		
		comment: 'Hier können Sie eine Bemerkung eingeben';
		componentClass: MDLMATextAreaComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionBez [
	<magritteDescription>
	^ MAStringDescription new
	label: 'Bezeichnung';
		accessor: #bez;
		priority: 1;
		required: true;
		requiredErrorMessage: 'Bitte die Bezeichnung eingeben';
		comment: 'Bitte Ihren Benutzernamen eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionHsnr [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Hausnummer';
		accessor: #hsnr;
		priority: 2;
		required: true;
		requiredErrorMessage: 'Bitte die Hausnummer eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionOrt [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Ort';
		accessor: #ort;
		priority: 4;
		required: true;
		requiredErrorMessage: 'Bitte die Ort eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionPlz [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Postleitzahl';
		accessor: #plz;
		priority: 3;
		required: true;
		requiredErrorMessage: 'Bitte die Postleitzahl eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionStr [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Strassen Namen';
		accessor: #str;
		priority: 1;
		required: true;
		requiredErrorMessage: 'Bitte die Strasse eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #'magritte-accessing' }
ASDHMAdresse >> descriptionTel [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Telefon Nummer';
		accessor: #tel;
		priority: 5;
		required: true;
		requiredErrorMessage: 'Bitte die Telefon Nummer eingeben';
		componentClass: MDLMATextInputComponent;
		yourself
]

{ #category : #accessing }
ASDHMAdresse >> hsnr [
	^ hsnr
]

{ #category : #accessing }
ASDHMAdresse >> hsnr: anObject [
	hsnr := anObject
]

{ #category : #initialization }
ASDHMAdresse >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMAdresse >> land [
	^ land
]

{ #category : #accessing }
ASDHMAdresse >> land: anObject [
	land := anObject
]

{ #category : #accessing }
ASDHMAdresse >> objectId [

	^ objectId
]

{ #category : #accessing }
ASDHMAdresse >> objectId: anObject [

	objectId := anObject
]

{ #category : #accessing }
ASDHMAdresse >> ort [
	^ ort
]

{ #category : #accessing }
ASDHMAdresse >> ort: anObject [
	ort := anObject
]

{ #category : #accessing }
ASDHMAdresse >> plz [
	^ plz
]

{ #category : #accessing }
ASDHMAdresse >> plz: anObject [
	plz := anObject
]

{ #category : #accessing }
ASDHMAdresse >> str [
	^ str
]

{ #category : #accessing }
ASDHMAdresse >> str: anObject [
	str := anObject
]

{ #category : #accessing }
ASDHMAdresse >> tel [
	^ tel
]

{ #category : #accessing }
ASDHMAdresse >> tel: anObject [
	tel := anObject
]
