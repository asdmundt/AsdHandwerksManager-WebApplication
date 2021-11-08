Class {
	#name : #ASDHMPageAdmin,
	#superclass : #ASDHMComponent,
	#instVars : [
		'displayComponent'
	],
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #testing }
ASDHMPageAdmin class >> isAbstract [
	^ self = ASDHMPageAdmin
]

{ #category : #accessing }
ASDHMPageAdmin class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDHMPageAdmin class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDHMPageAdmin class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDHMPageAdmin class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDHMPageAdmin >> children [
	^ {}
]

{ #category : #accessing }
ASDHMPageAdmin >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDHMPageAdmin >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDHMPageAdmin >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMPageAdmin >> pathName [
	^ self class pathName
]
