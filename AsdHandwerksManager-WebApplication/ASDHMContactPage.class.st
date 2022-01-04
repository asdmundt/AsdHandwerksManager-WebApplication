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
	style: 'padding: 8px;';
		id: #tableDiv;
		with: [ html render: contactTable ]
]

{ #category : #rendering }
ASDHMContactPage >> renderContentOn: html [

	html div
		shadow: 0;
		style: 'height: auto; display: flex; padding-top: ';
		with: [ 
			html leftPanel
				class: 'mdl-components__nav';
				shadow: 0;
				style: 'height: 100%; width: 300px;';
				with: [ self renderSelectListOn: html ].
			(html tag: 'main')
				class: 'mdl-components__pages';
				with: [ self renderComponentOn: html ] ]
]

{ #category : #accessing }
ASDHMContactPage >> renderSelectListOn: html [

	| selectList |
	selectList := OrderedCollection new.
	selectList add: (ASDHMObjectViewTableContactComponent withList:
			 self session model contacts).

	html mdlList: [ 
		
			html mdlListItem: [ 
				html mdlListPrimaryContent: [
					html mdlIcon
								listItemAvatar;
								with: #person. 
					html mdlListItemTextBody: ASDHMContact titleText  ].
				html mdlListSecondaryContent: [ 
					html mdlListItemSecondaryAction with: [ 
						html anchor
							onClick:  (( html jQuery ajax )
			script: [ :s | 
				self contactTable:  (ASDHMObjectViewTableContactComponent withList:
			 self session model contacts).
				s << ( ( s jQuery id: 'tableDiv' ) load: [ html render: self contactTable ] ). 
				
			]	
		);			
							with: [[ html mdlIcon: #keyboard_arrow_right ]] ] ] ] ] 
]
