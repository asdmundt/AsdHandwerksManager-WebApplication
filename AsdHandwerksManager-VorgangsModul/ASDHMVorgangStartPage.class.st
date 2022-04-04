Class {
	#name : #ASDHMVorgangStartPage,
	#superclass : #ASDHMPageLogin,
	#instVars : [
		'titleCardAuftragsLabel',
		'titleCardAufgabenLabel',
		'textKeineAuftraege',
		'textKeineAufgaben',
		'titleCardTasksLabel',
		'textKeineTasks'
	],
	#category : #'AsdHandwerksManager-VorgangsModul-Pages'
}

{ #category : #accessing }
ASDHMVorgangStartPage class >> pageName [

	^ 'VorgangsVerwaltung'
]

{ #category : #accessing }
ASDHMVorgangStartPage class >> priority [

	^ 3
]

{ #category : #hooks }
ASDHMVorgangStartPage >> children [
	^ { }
]

{ #category : #initialization }
ASDHMVorgangStartPage >> initialize [

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
ASDHMVorgangStartPage >> renderAufgabenCardOn: html [

	html render: (MDLCardWidget new
			 shadow: 2;
			 style: 'width: 95%;margin:20px';
			 class: 'mdl-card__login-widget';
			 title: titleCardAufgabenLabel level: 2;
			 addTextContainer: [ :canvas | canvas text: textKeineAufgaben ];
			 yourself)
]

{ #category : #rendering }
ASDHMVorgangStartPage >> renderAuftragsCardOn: html [

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
ASDHMVorgangStartPage >> renderCardOn: html [
self renderAuftragsCardOn: html.
self renderTasksCardOn: html.
self renderAufgabenCardOn: html

]

{ #category : #rendering }
ASDHMVorgangStartPage >> renderContentOn: html [

					
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
ASDHMVorgangStartPage >> renderTasksCardOn: html [

	html render: (MDLCardWidget new
			 shadow: 2;
			 style: 'width: 95%;margin:20px';
			 class: 'mdl-card__login-widget';
			 title: self titleCardTasksLabel level: 2;
			 addTextContainer: [ :canvas | canvas text: self textKeineTasks ];
			 yourself)
]

{ #category : #rendering }
ASDHMVorgangStartPage >> style [

	^ ''
]

{ #category : #accessing }
ASDHMVorgangStartPage >> textKeineAufgaben [

	^ textKeineAufgaben
]

{ #category : #accessing }
ASDHMVorgangStartPage >> textKeineAufgaben: anObject [

	textKeineAufgaben := anObject
]

{ #category : #accessing }
ASDHMVorgangStartPage >> textKeineAuftraege [

	^ textKeineAuftraege
]

{ #category : #accessing }
ASDHMVorgangStartPage >> textKeineAuftraege: anObject [

	textKeineAuftraege := anObject
]

{ #category : #accessing }
ASDHMVorgangStartPage >> textKeineTasks [

	^ textKeineTasks
]

{ #category : #accessing }
ASDHMVorgangStartPage >> textKeineTasks: anObject [

	textKeineTasks := anObject
]

{ #category : #accessing }
ASDHMVorgangStartPage >> titleCardAufgabenLabel [

	^ titleCardAufgabenLabel
]

{ #category : #accessing }
ASDHMVorgangStartPage >> titleCardAufgabenLabel: anObject [

	titleCardAufgabenLabel := anObject
]

{ #category : #accessing }
ASDHMVorgangStartPage >> titleCardAuftragsLabel [

	^ titleCardAuftragsLabel
]

{ #category : #accessing }
ASDHMVorgangStartPage >> titleCardAuftragsLabel: anObject [

	titleCardAuftragsLabel := anObject
]

{ #category : #accessing }
ASDHMVorgangStartPage >> titleCardTasksLabel [

	^ titleCardTasksLabel
]

{ #category : #accessing }
ASDHMVorgangStartPage >> titleCardTasksLabel: anObject [

	titleCardTasksLabel := anObject
]
