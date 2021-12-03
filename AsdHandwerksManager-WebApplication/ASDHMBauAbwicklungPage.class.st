Class {
	#name : #ASDHMBauAbwicklungPage,
	#superclass : #ASDHMPageLogin,
	#instVars : [
		'installer'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMBauAbwicklungPage class >> pageName [
	^ 'AutoInstallation'
]

{ #category : #accessing }
ASDHMBauAbwicklungPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDHMBauAbwicklungPage >> children [
	^ { installer }
]

{ #category : #initialization }
ASDHMBauAbwicklungPage >> initialize [
|list|
super initialize.
list := OrderedCollection new.
 list
  add: ASDHMInstallConfigView;
	add: ASDHMInstallDataView;
	add: ASDHMInstallVorlagenView;
  add: ASDHMInstallServicesView.
	
	self session rootComponent header: ASDHMAdminHeader new.
	self installer: (ASDHMInstallerListcomponent withList: list)
	
]

{ #category : #accessing }
ASDHMBauAbwicklungPage >> installer [

	^ installer
]

{ #category : #accessing }
ASDHMBauAbwicklungPage >> installer: anObject [

	installer := anObject
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

{ #category : #rendering }
ASDHMBauAbwicklungPage >> style [
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
