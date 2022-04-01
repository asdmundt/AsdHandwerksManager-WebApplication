Class {
	#name : #ASDHMAuftragsVerwaltungPage,
	#superclass : #ASDHMPageAdmin,
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMAuftragsVerwaltungPage class >> pageName [
	^ 'Auftragsverwaltung'
]

{ #category : #accessing }
ASDHMAuftragsVerwaltungPage class >> priority [

	^ 6
]

{ #category : #hooks }
ASDHMAuftragsVerwaltungPage >> children [
	^ {  }
]

{ #category : #initialization }
ASDHMAuftragsVerwaltungPage >> initialize [

	
	super initialize.
	
	self session rootComponent header: ASDHMAdminHeader new.
	
]

{ #category : #rendering }
ASDHMAuftragsVerwaltungPage >> renderContentOn: html [
	html mdlGrid
		noSpacing;
		with: [ 
			html mdlCell
				class: 'rootComponent';
				size: 12;
				with: [ 
					html div
						class: 'container';
						with: [ 
							html div
								class: 'center';
								with: [  ] ] ] ]
]
