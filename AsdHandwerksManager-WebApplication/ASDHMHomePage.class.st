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
	^ 'Home'
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

	html render: (MDLCardWidget new
			 shadow: 2;
			 style: 'width: 95%;margin:20px';
			 class: 'mdl-card__login-widget';
			 title: titleCardAufgabenLabel level: 2;
			 addTextContainer: [ :canvas | canvas text: textKeineAufgaben ];
			 yourself)
]

{ #category : #rendering }
ASDHMHomePage >> renderAuftragsCardOn: html [

	html render: (MDLCardWidget new
			 shadow: 2;
			 style: 'width: 95%;margin:20px';
			 class: 'mdl-card__login-widget';
			 title: titleCardAuftragsLabel level: 2;
			 addTextContainer: [ :canvas | 
				 canvas text: self textKeineAuftraege ];
			 yourself)
]

{ #category : #rendering }
ASDHMHomePage >> renderCardOn: html [

	"self renderAuftragsCardOn: html."
	self renderTasksCardOn: html.
	self renderAufgabenCardOn: html
]

{ #category : #rendering }
ASDHMHomePage >> renderContentOn: html [

					
	html div
		shadow: 2;
		style: 'display: flex;';
		with: [ 
			html div
				class: 'content';
				id: 'contentWithoutside';
				style: 'flex-grow: 1;';
				with: [ self renderCardOn: html ] ].
	html html: '<script type="text/javascript">'.
	html html: '	window.addEventListener("resize", jsResize);
							window.addEventListener("load", jsResize);'.
	html html: 'function jsResize() {'.
	html html: 'var ah 	= screen.availHeight;'.
	html html: 'var aw 	= screen.availWidth;'.
	html html: 'var mh 	= (ah - 400) + ''px'';'.
	html html: 'var th 	= (ah - 350) + ''px'';'.
	html html: 'var lw 	= (aw - 880) + ''px'';'.
	html html: 'var wlw 	= (aw - 200) + ''px'';'.
	html html:
		'document.getElementById("contentWithoutside").style.width = wlw;'.
	html html:
		'document.getElementById("contentWithoutside").style.height = th;
		}'.
	html html: '</script>'				
]

{ #category : #rendering }
ASDHMHomePage >> renderTasksCardOn: html [

	html render: (MDLCardWidget new
			 shadow: 2;
			 style: 'width: 95%;margin:20px';
			 class: 'mdl-card__login-widget';
			 title: self titleCardTasksLabel level: 2;
			 addTextContainer: [ :canvas | canvas text: self textKeineTasks ];
			 yourself)
]

{ #category : #rendering }
ASDHMHomePage >> style [

	^ ''
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
