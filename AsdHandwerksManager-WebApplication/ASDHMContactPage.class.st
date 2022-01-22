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
	^ 1
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
		style: 'height: auto; display: flex; margin-top: ';
		with: [ 
			html leftPanel
				shadow: 0;
				style:
					'height: 100%; width: 300px; border: 1px solid #30363d !important;';
				with: [ self renderSelectListOn: html ].
			(html tag: 'main') with: [ self renderComponentOn: html ] ]
]

{ #category : #accessing }
ASDHMContactPage >> renderSelectListOn: html [

	html mdlList: [ 
		html mdlListItem: [ 
			html mdlListPrimaryContent: [ 
				html mdlIcon
					listItemIcon;
					with: #person.
				html mdlListItemTextBody: ASDHMContact titleText ].
			html mdlListSecondaryContent: [ 
				html mdlListItemSecondaryAction with: [ 
					html anchor
						onClick: (html jQuery ajax script: [ :s | 
									 self contactTable:
											 (ASDHMObjectViewTableContactComponent withList:
													  self session model contacts).
									 s << ((s jQuery id: #tableDiv) load html: [ :h | 
												  h render: self contactTable ]) ]);
						with: [ 
							html mdlButton
								fab;
								miniFab;
								with: [ html mdlIcon: 'keyboard_arrow_right' ] ] ] ] ].
		html mdlListItem: [ 
			html mdlListPrimaryContent: [ 
				html mdlIcon
					listItemIcon;
					with: #perm_contact_calendar.
				html mdlListItemTextBody: ASDHMKunde titleText ].
			html mdlListSecondaryContent: [ 
				html mdlListItemSecondaryAction with: [ 
					html anchor
						onClick: (html jQuery ajax script: [ :s | 
									 self contactTable:
											 (ASDHMObjectViewTableKundeComponent withList:
													  self session model contacts).
									 s << ((s jQuery id: #tableDiv) load html: [ :h | 
												  h render: self contactTable ]) ]);
						with: [ 
							html mdlButton
								fab;
								miniFab;
								with: [ html mdlIcon: 'keyboard_arrow_right' ] ] ] ] ] ]
]
