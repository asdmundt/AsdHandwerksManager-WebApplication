Class {
	#name : #ASDHMObjectViewTableComponent,
	#superclass : #ASDHMBaseComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'list'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMObjectViewTableComponent class >> withList: aList [
^ self new list: aList

	
]

{ #category : #initialization }
ASDHMObjectViewTableComponent >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> list [

	^ list
]

{ #category : #accessing }
ASDHMObjectViewTableComponent >> list: anObject [

	list := anObject
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderAddDialog: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderContentOn: html [

	html div
		class: 'asdContainer';
		shadow: 2;
		with: [ 
			html div
				class: 'bar';
				with: [ 
					html div
						class: 'wrapper';
						with: [ 
							html mdlAnchorButton
								icon;
								id: html nextId;
								openDialogWithId: self rootDialogOpenId;
								onClickUpdateRootDialogWith: [ :r | self renderAddDialog: r ];
								with: [ html mdlIcon: 'add' ].

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
				style: 'width: 100%;min-width: 0px;overflow: scroll;height: 400px;';
				with: [ self renderInnerContentOn: html ] ]
]

{ #category : #rendering }
ASDHMObjectViewTableComponent >> renderInnerContentOn: html [
	self subclassResponsibility
]
