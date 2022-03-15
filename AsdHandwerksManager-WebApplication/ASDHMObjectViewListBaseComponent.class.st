Class {
	#name : #ASDHMObjectViewListBaseComponent,
	#superclass : #ASDHMBaseComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'visible',
		'title',
		'components',
		'labelSelect',
		'labelDelete',
		'list',
		'labelEdit',
		'labelBez'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMObjectViewListBaseComponent class >> withList: aList [

	^ self new list: aList; yourself 
]

{ #category : #actions }
ASDHMObjectViewListBaseComponent >> add [
self subclassResponsibility
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> components [

	^ components
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> components: anObject [

	components := anObject
]

{ #category : #actions }
ASDHMObjectViewListBaseComponent >> edit: anObject [


	self subclassResponsibility
]

{ #category : #initialization }
ASDHMObjectViewListBaseComponent >> initialize [

	super initialize.
		self labelSelect: 'Auswählen'.
	self labelEdit: 'Bearbeiten'.
	self labelDelete: 'Entfernen'.
	


]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelBez [

	^ labelBez
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelBez: anObject [

	labelBez := anObject
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelDelete [

	^ labelDelete
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelDelete: anObject [

	labelDelete := anObject
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelEdit [

	^ labelEdit
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelEdit: anObject [

	labelEdit := anObject
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelSelect [

	^ labelSelect
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> labelSelect: anObject [

	labelSelect := anObject
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> list [

	^ list ifNil: [ list := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> list: anObject [

	list := anObject
]

{ #category : #actions }
ASDHMObjectViewListBaseComponent >> remove: anObject [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewListBaseComponent >> renderBezOn: html [

	html text: self labelBez 
]

{ #category : #rendering }
ASDHMObjectViewListBaseComponent >> renderContentOn: html [

	html div
		style: ' display: block; height: 100%; margin: 0px 0px 0px 0px; padding-left: 5px;';
		shadow: 0;
		with: [ 
			html div
				class: 'bar';
				with: [ 
					html text: self session kategorieKuerzel asString .


					html div
						class: 'wrapper';
						with: [ 
							self renderDialogMenu: html.

							html mdlButton icon
								id: #bottomRightButton;
								with: [ html mdlIcon: #more_vert ].
							html mdlMenu
								bottomLeft;
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
ASDHMObjectViewListBaseComponent >> renderDialogMenu: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewListBaseComponent >> renderInnerContentOn: html [
	self subclassResponsibility
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> title [

	^ title
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> title: anObject [

	title := anObject
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> visible [

	^ visible
]

{ #category : #accessing }
ASDHMObjectViewListBaseComponent >> visible: anObject [

	visible := anObject
]
