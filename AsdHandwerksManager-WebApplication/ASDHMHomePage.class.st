Class {
	#name : #ASDHMHomePage,
	#superclass : #ASDHMPageLogin,
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMHomePage class >> pageName [
	^ 'AutoInstallation'
]

{ #category : #accessing }
ASDHMHomePage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDHMHomePage >> children [
	^ { }
]

{ #category : #initialization }
ASDHMHomePage >> initialize [

super initialize.

	
	self session rootComponent header: ASDHMAdminHeader new.
	
	
]

{ #category : #rendering }
ASDHMHomePage >> renderContentOn: html [
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
ASDHMHomePage >> renderInstallComponentOn: html [
	html div
		style: 'position: relative; height: 100%';
		with: [html render: self installer]
]

{ #category : #rendering }
ASDHMHomePage >> style [
^'#loaderWrapper {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 10;
  overflow: hidden;
background-color: #0b1727;
}'
]
