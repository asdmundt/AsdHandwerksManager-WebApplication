Class {
	#name : #ASDHMStepFormComponent,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'labelHeaderTitle',
		'steps',
		'stepsSize'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMStepFormComponent class >> withModel: aModel andSteps: aCollection [

	^ self new
		  model: aModel;
			steps: aCollection;
		  yourself
]

{ #category : #hooks }
ASDHMStepFormComponent >> children [

	^ Array with: self steps
]

{ #category : #initialization }
ASDHMStepFormComponent >> initialize [

	super initialize.
	self id: 'step-' , (self model) asString 
]

{ #category : #accessing }
ASDHMStepFormComponent >> labelHeaderTitle [

	^ labelHeaderTitle
]

{ #category : #accessing }
ASDHMStepFormComponent >> labelHeaderTitle: anObject [

	labelHeaderTitle := anObject
]

{ #category : #rendering }
ASDHMStepFormComponent >> renderContentOn: html [

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

{ #category : #accessing }
ASDHMStepFormComponent >> steps [

	^ steps
]

{ #category : #accessing }
ASDHMStepFormComponent >> steps: anObject [

	steps := anObject
]
