Class {
	#name : #ASDHMHomePage,
	#superclass : #ASDHMPageLogin,
	#instVars : [
		'titleCardAuftragsLabel',
		'titleCardAufgabenLabel',
		'textKeineAuftraege',
		'textKeineAufgaben',
		'titleCardTasksLabel',
		'textKeineTasks'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMHomePage class >> pageName [
	^ 'AutoInstallation'
]

{ #category : #accessing }
ASDHMHomePage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDHMHomePage >> children [
	^ { }
]

{ #category : #initialization }
ASDHMHomePage >> initialize [

super initialize.

self titleCardTasksLabel: 'Vorgänge'.
self titleCardAufgabenLabel: 'Aufgaben'.
self titleCardAuftragsLabel: 'Aufträge'.
self textKeineAufgaben: 'Es liegen keine neuen Aufgaben vor'.
self textKeineAuftraege: 'Es liegen keine neuen Auftäge vor'.
self textKeineTasks: 'Es liegen keine neuen Vorgänge vor'.	
	self session rootComponent header: ASDHMHeader new.
	
	
]

{ #category : #rendering }
ASDHMHomePage >> renderAufgabenCardOn: html [
	html
		render:
			(MDLCardWidget new
				shadow: 2;
				style: 'width: 400px;';
				class: 'mdl-card__login-widget';
				
				title: titleCardAufgabenLabel level: 2;
				addTextContainer: [ :canvas | canvas text: textKeineAufgaben ];
				yourself)
]

{ #category : #rendering }
ASDHMHomePage >> renderAuftragsCardOn: html [
	html
		render:
			(MDLCardWidget new
				shadow: 2;
				style: 'width: 400px;';
				class: 'mdl-card__login-widget';
				
				title: titleCardAuftragsLabel level: 2;
				addTextContainer: [ :canvas | canvas text: self textKeineAuftraege  ];
				yourself)
]

{ #category : #rendering }
ASDHMHomePage >> renderCardOn: html [
self renderAuftragsCardOn: html.
self renderTasksCardOn: html.
self renderAufgabenCardOn: html

]

{ #category : #rendering }
ASDHMHomePage >> renderContentOn: html [
 html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'rootComponent';
								size: 12;
								with: [ html div 
									class:'container';
									with:[ html div 
									class:'center';
									with:[  self renderCardOn: html] ]] ].
				

]

{ #category : #rendering }
ASDHMHomePage >> renderTasksCardOn: html [
	html
		render:
			(MDLCardWidget new
				shadow: 2;
				style: 'width: 400px;';
				class: 'mdl-card__login-widget';
				
				title: self titleCardTasksLabel level: 2;
				addTextContainer: [ :canvas | canvas text: self textKeineAuftraege  ];
				yourself)
]

{ #category : #rendering }
ASDHMHomePage >> style [
^'#loaderWrapper {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 10;
  overflow: hidden;
background-color: #0b1727;
}'
]

{ #category : #accessing }
ASDHMHomePage >> textKeineAufgaben [

	^ textKeineAufgaben
]

{ #category : #accessing }
ASDHMHomePage >> textKeineAufgaben: anObject [

	textKeineAufgaben := anObject
]

{ #category : #accessing }
ASDHMHomePage >> textKeineAuftraege [

	^ textKeineAuftraege
]

{ #category : #accessing }
ASDHMHomePage >> textKeineAuftraege: anObject [

	textKeineAuftraege := anObject
]

{ #category : #accessing }
ASDHMHomePage >> textKeineTasks [

	^ textKeineTasks
]

{ #category : #accessing }
ASDHMHomePage >> textKeineTasks: anObject [

	textKeineTasks := anObject
]

{ #category : #accessing }
ASDHMHomePage >> titleCardAufgabenLabel [

	^ titleCardAufgabenLabel
]

{ #category : #accessing }
ASDHMHomePage >> titleCardAufgabenLabel: anObject [

	titleCardAufgabenLabel := anObject
]

{ #category : #accessing }
ASDHMHomePage >> titleCardAuftragsLabel [

	^ titleCardAuftragsLabel
]

{ #category : #accessing }
ASDHMHomePage >> titleCardAuftragsLabel: anObject [

	titleCardAuftragsLabel := anObject
]

{ #category : #accessing }
ASDHMHomePage >> titleCardTasksLabel [

	^ titleCardTasksLabel
]

{ #category : #accessing }
ASDHMHomePage >> titleCardTasksLabel: anObject [

	titleCardTasksLabel := anObject
]
