Class {
	#name : #ASDHMLoginPage,
	#superclass : #ASDHMPage,
	#instVars : [
		'centerComponent',
		'loginComponent',
		'showLoginError'
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
ASDHMLoginPage >> centerComponent [
	^ centerComponent
]

{ #category : #accessing }
ASDHMLoginPage >> centerComponent: anObject [
	centerComponent := anObject
]

{ #category : #accessing }
ASDHMLoginPage >> hasLoginError [
	^ showLoginError ifNil: [ false ]
]

{ #category : #initialize }
ASDHMLoginPage >> initialize [
	 super initialize
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

{ #category : #rendering }
ASDHMLoginPage >> rendeModalLoginButtonOn: html [
	html
		form: [ html
				render:
					(ASDLoginCardWidget new
						callback:
								[ :login :password | self rootComponent tryConnectionWithLogin: login andPassword: password ];
						yourself) ].
	self rootComponent 
 class development
		ifTrue: [ html anchor
				callback: [ self show: (WAInspector current on: self session) ];
				with: 'Inspect Session' ]
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
								class: 'centerInner';
								with: [ self rendeModalLoginButtonOn: html ] ] ] ]
]
