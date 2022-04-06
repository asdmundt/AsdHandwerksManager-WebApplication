Class {
	#name : #ASDHMAkquisePage,
	#superclass : #ASDHMPageLogin,
	#instVars : [
		'contactTable',
		'aktionsContactTable'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMAkquisePage class >> pageName [

	^ 'Verkauf'
]

{ #category : #accessing }
ASDHMAkquisePage class >> priority [

	^ 3
]

{ #category : #accessing }
ASDHMAkquisePage >> aktionsContactTable [

	^ aktionsContactTable
]

{ #category : #accessing }
ASDHMAkquisePage >> aktionsContactTable: anObject [

	aktionsContactTable := anObject
]

{ #category : #hooks }
ASDHMAkquisePage >> children [
	^ { contactTable }
]

{ #category : #accessing }
ASDHMAkquisePage >> contactTable [

	^ contactTable
]

{ #category : #accessing }
ASDHMAkquisePage >> contactTable: anObject [

	contactTable := anObject
]

{ #category : #initialization }
ASDHMAkquisePage >> initialize [

	| contacts |
	super initialize.
	contacts := OrderedCollection new.
	self contactTable:
		(ASDHMObjectViewTableKlickTelContactComponent withList: contacts).

	self session rootComponent header: ASDHMHeader new
]

{ #category : #rendering }
ASDHMAkquisePage >> renderContentOn: html [

	html div
		shadow: 2;
		
		style: 'display: flex;';
		with: [ 
			html div
				class: 'content';
				id: 'contentWithoutside';
				style: 'flex-grow: 1;';
				with: [ html render: contactTable ] ].
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
