Class {
	#name : #ASDHMInstallerComponent,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'title',
		'ready',
		'idTitle',
		'idContent',
		'idProgress',
		'progression',
		'labelTitle',
		'progressionStep'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #accessing }
ASDHMInstallerComponent >> idContent [

	^ idContent
]

{ #category : #accessing }
ASDHMInstallerComponent >> idContent: anObject [

	idContent := anObject
]

{ #category : #accessing }
ASDHMInstallerComponent >> idProgress [

	^ idProgress
]

{ #category : #accessing }
ASDHMInstallerComponent >> idProgress: anObject [

	idProgress := anObject
]

{ #category : #accessing }
ASDHMInstallerComponent >> idTitle [

	^ idTitle
]

{ #category : #accessing }
ASDHMInstallerComponent >> idTitle: anObject [

	idTitle := anObject
]

{ #category : #initialization }
ASDHMInstallerComponent >> initialize [

	super initialize.
	self progression: 0.
	self labelTitle: 'Basis Installation'
]

{ #category : #accessing }
ASDHMInstallerComponent >> labelTitle [

	^ labelTitle
]

{ #category : #accessing }
ASDHMInstallerComponent >> labelTitle: anObject [

	labelTitle := anObject
]

{ #category : #accessing }
ASDHMInstallerComponent >> progression [

	^ progression
]

{ #category : #accessing }
ASDHMInstallerComponent >> progression: anObject [

	progression := anObject
]

{ #category : #accessing }
ASDHMInstallerComponent >> progressionStep [

	^ progressionStep
]

{ #category : #accessing }
ASDHMInstallerComponent >> progressionStep: anObject [

	progressionStep := anObject
]

{ #category : #accessing }
ASDHMInstallerComponent >> ready [

	^ ready
]

{ #category : #accessing }
ASDHMInstallerComponent >> ready: anObject [

	ready := anObject
]

{ #category : #rendering }
ASDHMInstallerComponent >> renderActionContentOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMInstallerComponent >> renderContentOn: html [

	html mdlCard
		shadow: 2;
		mdlTypographyTextLeft;
		style: 'width: 100%';
		with: [ 
			html mdlCardTitleContainer
				style: 'height: 40px;';
				id: self idTitle;
				with: [ html mdlCardTitleText: self labelTitle ].

			html mdlCardTextContainer
				id: self idContent;
				with: [ self renderInnerContentOn: html ].


			html mdlCardActions
				border;
				with: [ self renderActionContentOn: html ] ]
]

{ #category : #rendering }
ASDHMInstallerComponent >> renderInnerContentOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
ASDHMInstallerComponent >> renderProgressContentOn: html [

	html div
		class: 'asdProgress';
		with: [ 
			html div
				id: self idProgress;
				with: [ 
					html render:
							(MDLProgressBarWidget progression: [ self progression ] every: 0.2 seconds) ] ]
]

{ #category : #hooks }
ASDHMInstallerComponent >> script [

	^ '
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
'
]

{ #category : #hooks }
ASDHMInstallerComponent >> style [

	^ '
.asdProgress {
  width: 100%;
  background-color: #ddd;
}

#asdBar {
  width: 1%;
  height: 30px;
  background-color: #04AA6D;
}
'
]

{ #category : #accessing }
ASDHMInstallerComponent >> title [

	^ title
]

{ #category : #accessing }
ASDHMInstallerComponent >> title: anObject [

	title := anObject
]
