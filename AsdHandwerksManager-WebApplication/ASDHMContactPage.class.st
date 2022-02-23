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
		style: 'margin-left: 38px;';
		id: #tableDiv;
		with: [ html render: contactTable ]
]

{ #category : #rendering }
ASDHMContactPage >> renderContentOn: html [

	html div
		shadow: 0;
		style: 'height: 100%; display: flex; margin-top: width: 100%;';
		with: [ 
			html leftPanel
				shadow: 0;
				style:
					'height: 100%; width: 300px; border: 1px solid #30363d !important;';
				with: [ self renderSelectListOn: html ].
			html div style: 'width: 100%; height: 100%;';  with: [ self renderComponentOn: html ] ]
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
