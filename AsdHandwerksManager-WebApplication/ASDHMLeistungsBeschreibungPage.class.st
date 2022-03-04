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
		style: 'display:block; height: 100%;';
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

	html mdlGrid
		noSpacing;
		with: [ 
			html mdlCell
				class: 'sideBar';
				id: 'sideBar';
				size: 3;
				stretch;
				tabletSize: 2;
				with: [ self renderBaumOn: html ].
			html mdlCell
				class: 'content';
				id: 'content';
				size: 9;
				stretch;
				tabletSize: 6;
				with: [ self renderComponentOn: html ] ]
]
