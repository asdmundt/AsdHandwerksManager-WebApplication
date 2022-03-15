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

	html div
		shadow: 2;
		style: 'display: flex;';
		with: [ 
			html leftPanel
				style: 'height: 100%; width: 300px;';
				class: 'sideBar';
				id: 'sideBar';
				with: [ 
					self renderSelectListOn: html.
					html leftPanelResizer ].
			html div
				class: 'content';
				id: 'content';
				style: 'flex-grow: 1;';
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
