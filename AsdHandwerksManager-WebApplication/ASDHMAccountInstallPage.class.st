Class {
	#name : #ASDHMAccountInstallPage,
	#superclass : #ASDHMPageAdmin,
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMAccountInstallPage class >> pageName [
	^ 'Basis'
]

{ #category : #accessing }
ASDHMAccountInstallPage class >> priority [
	^ 1
]

{ #category : #hooks }
ASDHMAccountInstallPage >> children [
	^ {  }
]

{ #category : #initialization }
ASDHMAccountInstallPage >> initialize [
	super initialize.
	self session rootComponent header: ASDHMAdminHeader new 
	
]

{ #category : #rendering }
ASDHMAccountInstallPage >> renderContentOn: html [
	html mdlGrid
		shadow: 0;
		style: 'align-items: center; height: 100%';
		with: [ html mdlCell
				middle;
				desktopSize: 8;
				tabletSize: 5;
				phoneSize: 2;
				
				with: [ self renderModalLoginButtonOn: html ] ]
]
