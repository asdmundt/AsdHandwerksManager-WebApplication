Class {
	#name : #ASDHMBauAbwicklungPage,
	#superclass : #ASDHMPageAdmin,
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMBauAbwicklungPage class >> pageName [
	^ 'Bauabwicklung'
]

{ #category : #accessing }
ASDHMBauAbwicklungPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDHMBauAbwicklungPage >> children [
	^ {  }
]

{ #category : #initialization }
ASDHMBauAbwicklungPage >> initialize [

super initialize.

	
	self session rootComponent header: ASDHMAdminHeader new.
	
	
]

{ #category : #rendering }
ASDHMBauAbwicklungPage >> renderContentOn: html [
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
ASDHMBauAbwicklungPage >> renderInstallComponentOn: html [
	html div
		style: 'position: relative; height: 100%';
		with: [html render: self installer]
]
