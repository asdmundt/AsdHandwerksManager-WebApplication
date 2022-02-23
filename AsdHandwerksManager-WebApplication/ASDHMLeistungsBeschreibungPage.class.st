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
	^ { leistungenList }
]

{ #category : #initialization }
ASDHMLeistungsBeschreibungPage >> initialize [

	super initialize.

	self kategorieTreeComponent: (ASDHMIKategorieBaumComponent withList:
			 (self session model ebeneEinsKategorien)).
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
ASDHMLeistungsBeschreibungPage >> renderComponentOn: html [

	html div
		style: 'margin-left: 38px;display:block;';
		id: #tableLeistungDiv;
		with: [ html render: leistungenList ]
]

{ #category : #rendering }
ASDHMLeistungsBeschreibungPage >> renderContentOn: html [

	html mdlGrid
		
		with: [ 
			html mdlCell
				class: 'grid-cell-demo';
				size: 2;
				stretch;
				tabletSize: 8;
				with: '6 (8 tablet)'.
			html mdlCell
				class: 'grid-cell-demo';
				size: 10;
				stretch;
				tabletSize: 6;
				with: [ 
					
							 self renderComponentOn: html ]].
			
]
