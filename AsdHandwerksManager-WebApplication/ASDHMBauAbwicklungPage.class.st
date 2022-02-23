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
	^ 4
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

]
