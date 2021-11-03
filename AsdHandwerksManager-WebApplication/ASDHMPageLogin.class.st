Class {
	#name : #ASDHMPageLogin,
	#superclass : #ASDHMComponent,
	#instVars : [
		'displayComponent'
	],
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #testing }
ASDHMPageLogin class >> isAbstract [
	^ self = ASDBPageLogin
]

{ #category : #accessing }
ASDHMPageLogin class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDHMPageLogin class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDHMPageLogin class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDHMPageLogin class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDHMPageLogin >> children [
	^ {}
]

{ #category : #accessing }
ASDHMPageLogin >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDHMPageLogin >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDHMPageLogin >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMPageLogin >> pathName [
	^ self class pathName
]
