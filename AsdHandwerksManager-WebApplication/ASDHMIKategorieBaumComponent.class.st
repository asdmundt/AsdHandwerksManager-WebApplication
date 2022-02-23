Class {
	#name : #ASDHMIKategorieBaumComponent,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'components',
		'labelLeistungsKategorien'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMIKategorieBaumComponent class >> withList: aList [
	^ self new
		components: aList

]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> components [

	^ components ifNil: [ components := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> components: anObject [

	components := anObject
]

{ #category : #initialization }
ASDHMIKategorieBaumComponent >> initialize [

	super initialize.
	self labelLeistungsKategorien: 'Kategorie Leistungen'.
	self components: OrderedCollection new.
	
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> labelLeistungsKategorien [

	^ labelLeistungsKategorien
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> labelLeistungsKategorien: anObject [

	labelLeistungsKategorien := anObject
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderCardOn: html with: object [

	
	html mdlExpansionPanel
		shadow: 0;
		expand; "Optional, this is the default."
		with: [ html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [
					html mdlExpansionPanelHeaderIcon.
					 html mdlExpansionPanelHeaderTitle: '/ '.
					html mdlExpansionPanelHeaderDescription: object bez.
					].
			html
				mdlExpansionPanelContent style:'margin-left:20px; margin-bottom:10px;'; with: [
					self renderListOn: html with: object.
					
					] ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderContentOn: html [

	html div
		class: 'deepPanel';
		shadow: 0;
		with: [
			self renderListOn: html
			]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderListOn: html [

	| componentInstance |
	html mdlList
		style: 'width: 100%';
		id: #installerList;
		with: [ 
			components do: [ :component | 
					"componentInstance := component new."
					html mdlListItem: [ 
							html mdlListPrimaryContent: [ html render: component new yourself  ] ] ] ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderListOn: html with: object [

	
	html mdlList
		style: 'width: 100%';
		with: [ 
			object childs do: [ :component | 
					html mdlListItem: [ 
						self renderCardOn: html with: object	
							 ] ] ]
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> title [

	^ title
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> visible [

	^ visible
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> visible: anObject [

	^ visible := anObject
]
