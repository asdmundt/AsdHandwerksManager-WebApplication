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
html render: contactTable
]

{ #category : #rendering }
ASDHMContactPage >> renderContentOn: html [

	html leftPanel
		class: 'mdl-components__nav';
		shadow: 4;
		with: [ 
			html
				render: self defaultList;
				leftPanelResizer ].
	(html tag: 'main')
		class: 'mdl-components__pages';
		with: [ self renderComponentOn: html ]
]
