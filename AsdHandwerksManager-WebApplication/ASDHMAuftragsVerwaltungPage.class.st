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
	^ 5
]

{ #category : #hooks }
ASDHMAuftragsVerwaltungPage >> children [
	^ {  }
]

{ #category : #initialization }
ASDHMAuftragsVerwaltungPage >> initialize [

	| list |
	super initialize.
	
	self session rootComponent header: ASDHMAdminHeader new.
	
]

{ #category : #rendering }
ASDHMAuftragsVerwaltungPage >> renderContentOn: html [
 html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'rootComponent';
								size: 12;
								with: [ html div 
									class:'container';
									with:[ html div 
									class:'center';
									with:[  self renderInstallComponentOn: html] ]] ].
				
	html div
		id: #loaderWrapper;
		with: [ html div 
									class:'container';
									with:[ html div 
										class:'center';
										with:[  self renderInstallComponentOn: html] ] ]
]

{ #category : #rendering }
ASDHMAuftragsVerwaltungPage >> renderInstallComponentOn: html [
	html div
		style: 'position: relative; height: 100%';
		with: [html render: self installer]
]
