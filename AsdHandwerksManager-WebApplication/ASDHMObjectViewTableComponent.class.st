Class {
	#name : #ASDHMObjectViewTableComponent,
	#superclass : #ASDHMBaseComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'list',
		'labelView',
		'labelEdit',
		'labelDelete',
		'labelSelect',
		'labelDisplayString',
		'labelAnrede',
		'labelTitle',
		'labelVorname',
		'labelNachname',
		'labelEmail',
		'labelTelefonNr',
		'labelMobileFunkNr',
		'labelAdresse',
		'labeBankverbindungen',
		'labelBez',
		'labelPersoenlicheDaten',
		'labelKommunikation',
		'labelaktionen'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMObjectViewTableComponent class >> withList: aList [
^ self new list: aList

	
]

{ #category : #actions }
ASDHMObjectViewTableComponent >> add [
self subclassResponsibility
]

{ #category : #actions }
ASDHMObjectViewTableComponent >> edit: anObject [


	self subclassResponsibility
]

{ #category : #initialization }
ASDHMObjectViewTableComponent >> initialize [

	super initialize.
	self labelKommunikation: 'Kommunikation'.
	self labeBankverbindungen: 'Bankverbindungen'.
	self labelAdresse: 'Adressen'.
	self labelPersoenlicheDaten: 'Persönliche Daten'
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labeBankverbindungen [

	^ labeBankverbindungen
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labeBankverbindungen: anObject [

	labeBankverbindungen := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelAdresse [

	^ labelAdresse
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelAdresse: anObject [

	labelAdresse := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelAnrede [

	^ labelAnrede
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelAnrede: anObject [

	labelAnrede := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelDelete [

	^ labelDelete
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelDelete: anObject [

	labelDelete := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelDisplayString [

	^ labelDisplayString
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelDisplayString: anObject [

	labelDisplayString := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelEdit [

	^ labelEdit
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelEdit: anObject [

	labelEdit := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelEmail [

	^ labelEmail
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelEmail: anObject [

	labelEmail := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelKommunikation [

	^ labelKommunikation
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelKommunikation: anObject [

	labelKommunikation := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelMobileFunkNr [

	^ labelMobileFunkNr
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelMobileFunkNr: anObject [

	labelMobileFunkNr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelNachname [

	^ labelNachname
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelNachname: anObject [

	labelNachname := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelPersoenlicheDaten [

	^ labelPersoenlicheDaten
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelPersoenlicheDaten: anObject [

	labelPersoenlicheDaten := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelSelect [

	^ labelSelect
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelSelect: anObject [

	labelSelect := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelTelefonNr [

	^ labelTelefonNr
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelTelefonNr: anObject [

	labelTelefonNr := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelView [

	^ labelView
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelView: anObject [

	labelView := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelVorname [

	^ labelVorname
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelVorname: anObject [

	labelVorname := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelaktionen [

	^ labelaktionen
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> labelaktionen: anObject [

	labelaktionen := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> list [

	^ list
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> list: anObject [

	list := anObject
]

{ #category : #actions }
ASDHMObjectViewTableComponent >> remove: anObject [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderAddDialog: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderBezOn: html [

	html text: self labelBez 
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderContentOn: html [

	html div
		class: 'asdContainer';
		shadow: 0;
		with: [ 
			html div
				class: 'bar';
				with: [ 
					html div
						class: 'wrapper';
						with: [ 
							self renderDialogMenu: html.

							html mdlButton icon
								id: #bottomRightButton;
								with: [ html mdlIcon: #more_vert ].
							html mdlMenu
								bottomRight;
								for: #bottomRightButton;
								with: [ 
									html mdlMenuItem: 'Some Action'.
									html mdlMenuItem
										fullBleedDivider;
										with: 'Another Action'.
									html mdlMenuItem
										disabled;
										with: 'Disabled Action'.
									html mdlMenuItem: 'Yet Another Action' ] ] ].
			html div
				class: 'background';
				style:
					'width: 100%;min-width: 0px;overflow-y: scroll;height: 400px;';
				with: [ self renderInnerContentOn: html ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderDialogMenu: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderInnerContentOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderTableHeadingActions: html [

	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelView.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelEdit.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelDelete.		
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelSelect 
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderTableHeadingPersonalData: html [

	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelView.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelEdit.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelDelete.
	html mdlTableHeading
		nonNumerical;
		style: 'background-color: #161b22; position: relativ; top: 0px;';
		with: self labelSelect
]
