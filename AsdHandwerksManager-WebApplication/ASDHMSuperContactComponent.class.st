Class {
	#name : #ASDHMSuperContactComponent,
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
ASDHMSuperContactComponent >> initialize [

	super initialize.
	self labelTelefonNr: 'Telefon Nr.'.
	self labelMobilfunkNr: 'Mobil Funk Nr.'.
	self labelEmail: 'Email'.
	self labelFieldset: 'Kommunikation'
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelFieldset [

	^ labelFieldset
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelFieldset: anObject [

	labelFieldset := anObject
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelMobilfunkNr [

	^ labelMobilfunkNr
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelMobilfunkNr: anObject [

	labelMobilfunkNr := anObject
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMSuperContactComponent >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #rendering }
ASDHMSuperContactComponent >> renderBezOn: html [
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
ASDHMSuperContactComponent >> renderCommunicationDataPanelOn: html [

	html fieldSet
		legend: self labelFieldset;
		with: [ 
			html div: [ 
					html span: [ 
							html paragraph
								
								with: self model telefonNummer  , ' '.
							html paragraph
								
								with: self model mobilFunkNr , ' '.
							
							html paragraph
								
								with: self model email ] ] ]
]

{ #category : #rendering }
ASDHMSuperContactComponent >> renderFieldsOn: html [
	self renderBezOn: html.
	self renderStrOn: html.
	self renderHsnrOn: html.
	self renderPlzOn: html.
	self renderOrtOn: html.
	
]

{ #category : #rendering }
ASDHMSuperContactComponent >> renderFormContentOn: html [
	self renderFieldsOn: html.

]
