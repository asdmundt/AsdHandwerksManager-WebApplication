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
		style:
			'  display: block; height: 100%; margin: 0px 0px 0px 0px; padding-left: 5px;position:absolute; z-index:10; left:10px; top:10px; width:100%';
		shadow: 0;
		with: [ 
			html div
				class: 'titleBar';
				with: [ 
					html text: self labelHeaderTitle.

					html div
						class: 'wrapper';
						with: [ 
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
ASDHMObjectViewComponent >> renderInnerContentOn: html [
	self subclassResponsibility
]
