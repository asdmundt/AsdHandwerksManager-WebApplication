Class {
	#name : #ASDHMObjectViewTableBaseContactComponent,
	#superclass : #ASDHMObjectViewTableBaseComponent,
	#instVars : [
		'labeBankverbindungen',
		'labelaktionen',
		'labelContact',
		'labelAdresse',
		'labelKommunikation',
		'labelDisplayString',
		'labelDisplayStringAdress',
		'labelDisplayStringBank',
		'labelDisplayStringKommunikation'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewTableBaseContactComponent >> initialize [

	super initialize.
	self labelKommunikation: 'Kommunikation'.
	self labeBankverbindungen: 'Bankverbindungen'.
	self labelDisplayString: 'Name'.
	self labelDisplayStringAdress: 'Adress Informationen'.
	self labelDisplayStringBank: 'Bank Daten'.
	self labelDisplayStringKommunikation: 'Kommunikations Informationen'.
	
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labeBankverbindungen [

	^ labeBankverbindungen
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labeBankverbindungen: anObject [

	labeBankverbindungen := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelAdresse [

	^ labelAdresse
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelAdresse: anObject [

	labelAdresse := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelContact [

	^ labelContact
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelContact: anObject [

	labelContact := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayString [

	^ labelDisplayString
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayString: anObject [

	labelDisplayString := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayStringAdress [

	^ labelDisplayStringAdress
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayStringAdress: anObject [

	labelDisplayStringAdress := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayStringBank [

	^ labelDisplayStringBank
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayStringBank: anObject [

	labelDisplayStringBank := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayStringKommunikation [

	^ labelDisplayStringKommunikation
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelDisplayStringKommunikation: anObject [

	labelDisplayStringKommunikation := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelKommunikation [

	^ labelKommunikation
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelKommunikation: anObject [

	labelKommunikation := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelView [

	^ labelView
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelView: anObject [

	labelView := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelaktionen [

	^ labelaktionen
]

{ #category : #accessing }
ASDHMObjectViewTableBaseContactComponent >> labelaktionen: anObject [

	labelaktionen := anObject
]

{ #category : #actions }
ASDHMObjectViewTableBaseContactComponent >> remove: anObject [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderBezOn: html [

	html text: self labelBez 
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderDialog: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseContactComponent >> renderDialogMenu: html [

	self subclassResponsibility
]
