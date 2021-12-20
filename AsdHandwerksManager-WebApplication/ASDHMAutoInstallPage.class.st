Class {
	#name : #ASDHMAutoInstallPage,
	#superclass : #ASDHMPageInstall,
	#instVars : [
		'installer'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMAutoInstallPage class >> pageName [
	^ 'AutoInstallation'
]

{ #category : #accessing }
ASDHMAutoInstallPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDHMAutoInstallPage >> children [
	^ { installer }
]

{ #category : #initialization }
ASDHMAutoInstallPage >> initialize [
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
ASDHMAutoInstallPage >> installer [

	^ installer
]

{ #category : #accessing }
ASDHMAutoInstallPage >> installer: anObject [

	installer := anObject
]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderContentOn: html [
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
				
	
]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderInstallComponentOn: html [
	html div
		style: 'position: relative; height: 100%';
		with: [html render: self installer]
]

{ #category : #rendering }
ASDHMAutoInstallPage >> style [
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
