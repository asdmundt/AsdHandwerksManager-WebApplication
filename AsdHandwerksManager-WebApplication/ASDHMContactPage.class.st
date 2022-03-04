Class {
	#name : #ASDHMContactPage,
	#superclass : #ASDHMPageLogin,
	#instVars : [
		'contactTable'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMContactPage class >> pageName [
	^ 'Kontakte'
]

{ #category : #accessing }
ASDHMContactPage class >> priority [
	^ 2
]

{ #category : #hooks }
ASDHMContactPage >> children [
	^ { contactTable }
]

{ #category : #accessing }
ASDHMContactPage >> contactTable [

	^ contactTable
]

{ #category : #accessing }
ASDHMContactPage >> contactTable: anObject [

	contactTable := anObject
]

{ #category : #initialization }
ASDHMContactPage >> initialize [

	super initialize.

	self contactTable: (ASDHMObjectViewTableContactComponent withList:
			 self session model contacts).
	self session rootComponent header: ASDHMHeader new
]

{ #category : #rendering }
ASDHMContactPage >> renderComponentOn: html [

	html div
		style: 'margin-left: 38px; height: 100%;';
		id: #tableDiv;
		with: [ html render: contactTable ]
]

{ #category : #rendering }
ASDHMContactPage >> renderContentOn: html [

	html mdlGrid
		noSpacing;
		with: [ 
			html mdlCell
				class: 'sideBar';
				id: 'sideBar';
				size: 2;
				stretch;
				tabletSize: 2;
				with: [ self renderSelectListOn: html ].
			html mdlCell
				class: 'content';
				id: 'content';
				size: 10;
				stretch;
				tabletSize: 6;
				with: [ self renderComponentOn: html ] ]
]

{ #category : #accessing }
ASDHMContactPage >> renderSelectListOn: html [

	html mdlList: [ 
		html mdlListItem: [ 
			html mdlListPrimaryContent: [ 
				html mdlIcon
					listItemIcon;
					with: #person.
				html mdlListItemTextBody: [  html anchor
						onClick: (html jQuery ajax script: [ :s | 
									 self contactTable:
											 (ASDHMObjectViewTableContactComponent withList:
													  self session model contacts).
									 s << ((s jQuery id: #tableDiv) load html: [ :h | 
												  h render: self contactTable ]) ]);
						with: [ html text:ASDHMContact titleText ]  ].
			]].
		html mdlListItem: [ 
			html mdlListPrimaryContent: [ 
				html mdlIcon
					listItemIcon;
					with: #perm_contact_calendar.
				html mdlListItemTextBody: [html anchor
						onClick: (html jQuery ajax script: [ :s | 
									 self contactTable:
											 (ASDHMObjectViewTableFirmenKontaktComponent withList:
													  self session model firmen).
									 s << ((s jQuery id: #tableDiv) load html: [ :h | 
												  h render: self contactTable ]) ]);
						with: [html text: ASDHMFirma titleText ]].
			 ] ]]
]
