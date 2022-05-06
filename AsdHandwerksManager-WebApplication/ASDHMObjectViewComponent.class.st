Class {
	#name : #ASDHMObjectViewComponent,
	#superclass : #ASDHMBaseComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'labelHeaderTitle'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewComponent >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMObjectViewComponent >> labelHeaderTitle [

	^ labelHeaderTitle
]

{ #category : #accessing }
ASDHMObjectViewComponent >> labelHeaderTitle: anObject [

	labelHeaderTitle := anObject
]

{ #category : #rendering }
ASDHMObjectViewComponent >> renderContentOn: html [
	html div
		class: 'container';
		shadow: 2;
		with: [ html div
				class: 'bar';
				with: [ html div
						class: 'wrapper';
						with: [ html mdlButton icon
								id: #bottomRightButton;
								with: [ html mdlIcon: #more_vert ].
							html mdlMenu
								bottomRight;
								for: #bottomRightButton;
								with: [ html mdlMenuItem: 'Some Action'.
									html mdlMenuItem
										fullBleedDivider;
										with: 'Another Action'.
									html mdlMenuItem
										disabled;
										with: 'Disabled Action'.
									html mdlMenuItem: 'Yet Another Action' ] ] ].
			html div
				class: 'background';
				with: [ self renderInnerContentOn: html ] ]
]

{ #category : #rendering }
ASDHMObjectViewComponent >> renderInnerContentOn: html [
	self subclassResponsibility
]
