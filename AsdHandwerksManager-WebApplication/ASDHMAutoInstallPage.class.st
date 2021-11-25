Class {
	#name : #ASDHMAutoInstallPage,
	#superclass : #ASDHMPageInstall,
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
	^ {  }
]

{ #category : #initialization }
ASDHMAutoInstallPage >> initialize [
	super initialize.
	self session rootComponent header: ASDHMAdminHeader new 
	
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
									with:[ html render: self componentToDisplay] ]] ].
				
	html div
		id: #loaderWrapper;
		with: [  ]
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
