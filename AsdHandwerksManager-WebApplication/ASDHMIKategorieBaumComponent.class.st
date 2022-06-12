Class {
	#name : #ASDHMIKategorieBaumComponent,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'components',
		'labelLeistungsKategorien',
		'leistungenListView'
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
	self labelLeistungsKategorien: 'Leistungs Kategorien'.
	self components: OrderedCollection new
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> labelLeistungsKategorien [

	^ labelLeistungsKategorien
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> labelLeistungsKategorien: anObject [

	labelLeistungsKategorien := anObject
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> leistungenListView [

	^ leistungenListView
]

{ #category : #accessing }
ASDHMIKategorieBaumComponent >> leistungenListView: anObject [

	leistungenListView := anObject
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderCardOn: html [

	html mdlExpansionPanel
		shadow: 0;
		class: 'mdl-expansion-panel-withoutBg';
		"Optional, this is the default."with: [ 
			html mdlExpansionPanelHeader
				toggleExpansionOnClick;
				with: [ 
					html mdlExpansionPanelHeaderIcon.
					html mdlExpansionPanelHeaderTitle
						style: 'padding: 0px; margin: 0px; color: #ffffffee;';
						with: [html text: self labelLeistungsKategorien ].
					html mdlExpansionPanelHeaderDescription
						style: 'padding: 0px; margin: 0px; color: #ffffffee;';
						with: [html text: '/' ] ].
			html mdlExpansionPanelContent
				style: 'margin-left:5px; margin-bottom:10px;';
				with: [ self renderListOn: html ] ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderCardOn: html with: object [

	html mdlExpansionPanel
		shadow: 0;
		fold;
		class: 'mdl-expansion-panel-withoutBg';
		style: 'padding: 0px; margin: 0px;';
		with: [ 
			html mdlExpansionPanelHeader
				style: 'padding: 0px; margin: 0px; height: 34px; padding: 5px;';
				toggleExpansionOnClick;
				with: [ 
					html mdlExpansionPanelHeaderIcon.
					html mdlExpansionPanelHeaderTitle
						style: 'padding: 0px; margin: 0px; color: #ffffffee;';
						with: [ html text: object kuerzel.
									html space.
									html text: object bez ].
					"html mdlExpansionPanelHeaderDescription
						style: 'padding: 0px; margin: 0px; color: #ffffffee;';
						with: [ html text: object bez ]" ].
			html mdlExpansionPanelContent
				style:
					'padding-top: 2px; padding-right: 0px; padding-bottom: 2px; padding-left: 8px; color: #ffffffee;';
				with: [ 
					object index asInteger = 2
						ifTrue: [ self renderKategorieOn: html with: object ]
						ifFalse: [ "object endIndex asInteger" 
							self renderListOn: html with: object ] ] ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderContentOn: html [

	html div
		class: 'deepPanel';
		style: 'margin: 5px;';
		shadow: 0;
		with: [ self renderCardOn: html ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderKategorieOn: html with: object [

	html mdlList
		class: 'mdl-list-tree';
		with: [ 
			object childs do: [ :component | "componentInstance := component new."
					html mdlListItem
						class: 'mdl-list__item-tree';
						with: [ 
							html mdlListPrimaryContent: [ 
									html mdlListItemTextBody
										style: 'padding-left: 15px;';
										with: [ 
											html anchor
												onClick: (html jQuery ajax script: [ :s | 
															 self session kategorieKuerzel: component kuerzel.
															 self leistungenListView:
																	 (ASDHMObjectViewListLeistungenComponent withList:
																			  (self session model leistungenWithKuerzel:
																					   component kuerzel)).
															 s
															 <<
																 ((s jQuery id: #tableLeistungDiv) load html: [ :h | 
																		  h render: self leistungenListView ]) ]);
												with: [ 
													html text: component kuerzel, '   ' , component bez ] ] ] ] ] ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderListOn: html [

	html mdlList
		class: 'mdl-list-tree';
		id: #installerList;
		with: [ 
			components do: [ :component | "componentInstance := component new." 
					html mdlListItem
						class: 'mdl-list__item-tree';
						with: [ self renderCardOn: html with: component ] ] ]
]

{ #category : #rendering }
ASDHMIKategorieBaumComponent >> renderListOn: html with: object [

	html mdlList
		style: 'width: 100%';
		class: 'mdl-list-tree';
		with: [ 
			object childs do: [ :component | 
					html mdlListItem
					class: 'mdl-list__item-tree';
					with: [ self renderCardOn: html with: component ] ] ]
]
