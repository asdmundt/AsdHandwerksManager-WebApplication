Class {
	#name : #ASDHMLoginPage,
	#superclass : #ASDHMPage,
	#instVars : [
		'loginComponent',
		'showLoginError',
		'model'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMLoginPage class >> pageName [
	^ 'Login'
]

{ #category : #accessing }
ASDHMLoginPage class >> priority [
	^ 1
]

{ #category : #accessing }
ASDHMLoginPage >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #initialize }
ASDHMLoginPage >> initialize [

	super initialize.
	self model: self session model.
]

{ #category : #accessing }
ASDHMLoginPage >> loginComponent [
	^ loginComponent
]

{ #category : #accessing }
ASDHMLoginPage >> loginComponent: anObject [
	loginComponent := anObject
]

{ #category : #actions }
ASDHMLoginPage >> loginErrorOccured [
        showLoginError := true
]

{ #category : #accessing }
ASDHMLoginPage >> model [

	^ model
]

{ #category : #accessing }
ASDHMLoginPage >> model: anObject [

	model := anObject
]

{ #category : #rendering }
ASDHMLoginPage >> rendeModalLoginButtonOn: html [
| users|
users := self model users.
users ifNil: [self rootComponent goToInstallView  ]  
ifNotNil: [ 
	html form: [ 
		html render: (ASDLoginCardWidget new
				 callback: [ :login :password | 
					 self rootComponent
						 tryConnectionWithLogin: login
						 andPassword: password ];
				 yourself) ].
	self rootComponent class development ifTrue: [ 
		html anchor
			callback: [ self show: (WAInspector current on: self session) ];
			with: 'Inspect Session' ] ]
	
]

{ #category : #rendering }
ASDHMLoginPage >> renderContentOn: html [

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
								with: [ self rendeModalLoginButtonOn: html ] ] ] ]
]
