Class {
	#name : #ASDHMObjectViewTableBaseComponent,
	#superclass : #ASDHMBaseComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'labelBez',
		'labelView',
		'labelEdit',
		'labelDelete',
		'labelSelect',
		'list'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMObjectViewTableBaseComponent class >> withList: aList [
^ self new list: aList

	
]

{ #category : #actions }
ASDHMObjectViewTableBaseComponent >> add [
self subclassResponsibility
]

{ #category : #actions }
ASDHMObjectViewTableBaseComponent >> edit: anObject [


	self subclassResponsibility
]

{ #category : #initialization }
ASDHMObjectViewTableBaseComponent >> initialize [

	super initialize.
		self labelSelect: 'Auswählen'.
	self labelEdit: 'Bearbeiten'.
	self labelDelete: 'Entfernen'.
	


]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelDelete [

	^ labelDelete
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelDelete: anObject [

	labelDelete := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelEdit [

	^ labelEdit
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelEdit: anObject [

	labelEdit := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelSelect [

	^ labelSelect
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> labelSelect: anObject [

	labelSelect := anObject
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> list [

	^ list ifNil: [ list := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMObjectViewTableBaseComponent >> list: anObject [

	list := anObject
]

{ #category : #actions }
ASDHMObjectViewTableBaseComponent >> remove: anObject [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseComponent >> renderAddDialog: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseComponent >> renderBezOn: html [

	html text: self labelBez 
]

{ #category : #rendering }
ASDHMObjectViewTableBaseComponent >> renderContentOn: html [

	html div
		style: 'display: block; height:100%';
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
					'width: 100%;min-height: 400px;overflow-y: auto; height:100%;';
				with: [ self renderInnerContentOn: html ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableBaseComponent >> renderDialogMenu: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseComponent >> renderInnerContentOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableBaseComponent >> renderTableHeadingActions: html [

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
