Class {
	#name : #ASDHMPageInstall,
	#superclass : #ASDHMComponent,
	#instVars : [
		'displayComponent'
	],
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #testing }
ASDHMPageInstall class >> isAbstract [
	^ self = ASDHMPageAdmin
]

{ #category : #accessing }
ASDHMPageInstall class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDHMPageInstall class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDHMPageInstall class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDHMPageInstall class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDHMPageInstall >> children [
	^ {}
]

{ #category : #accessing }
ASDHMPageInstall >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDHMPageInstall >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDHMPageInstall >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMPageInstall >> pathName [
	^ self class pathName
]
