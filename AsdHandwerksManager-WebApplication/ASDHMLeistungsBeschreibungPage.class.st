Class {
	#name : #ASDHMLeistungsBeschreibungPage,
	#superclass : #ASDHMPageAdmin,
	#instVars : [
		'leistungenList',
		'kategorieTreeComponent'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMLeistungsBeschreibungPage class >> pageName [
	^ 'Leistungsverzeichniss'
]

{ #category : #accessing }
ASDHMLeistungsBeschreibungPage class >> priority [
	^ 3
]

{ #category : #hooks }
ASDHMLeistungsBeschreibungPage >> children [
	^ { self kategorieTreeComponent. self leistungenList }
]

{ #category : #initialization }
ASDHMLeistungsBeschreibungPage >> initialize [

	super initialize.

	self kategorieTreeComponent: (ASDHMIKategorieBaumComponent withList:
			 self session model ebeneEinsKategorien).
	self leistungenList: (ASDHMObjectViewListLeistungenComponent withList:
			 self session model leistungen).
	self session rootComponent header: ASDHMAdminHeader new
]

{ #category : #accessing }
ASDHMLeistungsBeschreibungPage >> kategorieTreeComponent [

	^ kategorieTreeComponent
]

{ #category : #accessing }
ASDHMLeistungsBeschreibungPage >> kategorieTreeComponent: anObject [

	kategorieTreeComponent := anObject
]

{ #category : #accessing }
ASDHMLeistungsBeschreibungPage >> leistungenList [

	^ leistungenList
]

{ #category : #accessing }
ASDHMLeistungsBeschreibungPage >> leistungenList: anObject [

	leistungenList := anObject
]

{ #category : #rendering }
ASDHMLeistungsBeschreibungPage >> renderBaumOn: html [

	html div
		style: 'display:block; height: 95%;';
		id: #baumKategorieLeistungDiv;
		with: [ html render: self kategorieTreeComponent ]
]

{ #category : #rendering }
ASDHMLeistungsBeschreibungPage >> renderComponentOn: html [

	html div
		style: 'display:block; height: 100%;';
		id: #tableLeistungDiv;
		with: [ html render: leistungenList ]
]

{ #category : #rendering }
ASDHMLeistungsBeschreibungPage >> renderContentOn: html [

	html div
		shadow: 2;
		style: 'display: flex;';
		with: [ 
			html leftPanel
				style: 'height: 100%; width: 300px; overflow-y: auto;';
				class: 'sideBar';
				id: 'sideBar';
				with: [ 
					self renderBaumOn: html.
					html leftPanelResizer ].
			html div
				class: 'content';
				id: 'content';
				style: 'flex-grow: 1;';
				with: [ self renderComponentOn: html ] ].
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
	html html: 'document.getElementById("content").style.width = lw;'.
	html html: 'document.getElementById("content").style.height = th;'.
	html html: 'document.getElementById("sideBar").style.height = th;
	}'.
	html html: '</script>'
]
