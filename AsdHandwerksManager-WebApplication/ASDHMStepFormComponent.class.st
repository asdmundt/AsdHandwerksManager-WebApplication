Class {
	#name : #ASDHMStepFormComponent,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'labelHeaderTitle',
		'steps',
		'stepsSize',
		'currentStep'
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

{ #category : #accessing }
ASDHMStepFormComponent >> currentStep [

	^ currentStep
]

{ #category : #accessing }
ASDHMStepFormComponent >> currentStep: anObject [

	currentStep := anObject
]

{ #category : #initialization }
ASDHMStepFormComponent >> initialize [

	super initialize.
	
	self stepsSize: self steps size.
	self id: 'step-' , self stepsSize asString.
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

	| tabPanelId tmpComponent startComponent |
	startComponent := steps at: 1.
	tabPanelId := html nextId.
	html div
		id: self id;
		style:
			'  display: block; height: 100%; margin: 0px 0px 0px 0px; padding-left: 5px;position:absolute; z-index:10; left:10px; top:10px; width:100%';
		shadow: 0;
		with: [ "This example do not use any syntactic sugar to show the vanilla way of creating tabs. Other examples will introduce simpler way to create tabs."
			html div
				mdcElevation: 4;
				with: [ 
					html mdcTabBar: [ 
							html mdcTabScroller: [ 
									html mdcTabScrollerArea: [ 
											html mdcTabScrollerContent: [ 
													1 to: self currentStep do: [ :i | 
															tmpComponent := steps at: i.
															html mdcTab
																beActiveIf: i = self currentStep;
																onClick:
																	((html jQuery id: tabPanelId) load html: [ :canvas | 
																			 canvas render: tmpComponent ]);
																with: [ 
																	html mdcTabContent: [ 
																			html mdcTabLabel: tmpComponent labelSelf ].
																	html mdcTabIndicator
																		beActiveIf: i = self currentStep;
																		with: [ html mdcTabUnderlinedIndicatorContent ] ] ] ] ] ] ].
					html div
						id: tabPanelId;
						with: [ html render: startComponent ] ] ]
]

{ #category : #rendering }
ASDHMStepFormComponent >> renderReadyContentOn: html [

]

{ #category : #accessing }
ASDHMStepFormComponent >> steps [

	^ steps ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
ASDHMStepFormComponent >> steps: anObject [

	steps := anObject
]

{ #category : #accessing }
ASDHMStepFormComponent >> stepsSize [

	^ stepsSize
]

{ #category : #accessing }
ASDHMStepFormComponent >> stepsSize: anObject [

	stepsSize := anObject
]
