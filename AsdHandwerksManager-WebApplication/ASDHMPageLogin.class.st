Class {
	#name : #ASDHMPageLogin,
	#superclass : #ASDHMPageAdmin,
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #testing }
ASDHMPageLogin class >> isAbstract [
	^ self = ASDHMPageLogin
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

{ #category : #initialization }
ASDHMPageLogin >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMPageLogin >> pathName [
	^ self class pathName
]
