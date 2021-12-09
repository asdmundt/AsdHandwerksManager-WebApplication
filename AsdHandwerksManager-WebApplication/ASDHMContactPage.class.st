Class {
	#name : #ASDHMContactPage,
	#superclass : #ASDHMPageLogin,
	#instVars : [
		'installer'
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
	^ { installer }
]

{ #category : #initialization }
ASDHMContactPage >> initialize [

super initialize.

	
	self session rootComponent header: ASDHMHeader new.
	
	
]

{ #category : #accessing }
ASDHMContactPage >> installer [

	^ installer
]

{ #category : #accessing }
ASDHMContactPage >> installer: anObject [

	installer := anObject
]

{ #category : #rendering }
ASDHMContactPage >> renderComponentOn: html [
	html mdlCard
		shadow: 0;
		mdlTypographyTextLeft;
		"style: 'width: 512px';"
		with: [ 
			html mdlCardTitleContainer
	
				
				with: [ html mdlCardTitleText: 'Kunden' ].
				
			html mdlCardTextContainer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sagittis pellentesque lacus eleifend lacinia...'.

					
			html mdlCardMenu
				style: 'color: #fff';
				with: [ html mdlButton
						icon;
						rippleEffect;
						with: [ html mdlIcon: 'share' ] ] ]
]

{ #category : #rendering }
ASDHMContactPage >> renderContentOn: html [
 html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'rootComponent';
								size: 12;
								with: [ html div 
									class:'container';
									with:[ html div 
									class:'center';
									with:[  self renderComponentOn: html] ]] ].
				

]

{ #category : #rendering }
ASDHMContactPage >> style [
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
