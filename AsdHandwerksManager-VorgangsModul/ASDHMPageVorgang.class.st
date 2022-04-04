Class {
	#name : #ASDHMPageVorgang,
	#superclass : #ASDHMPageAdmin,
	#category : #'AsdHandwerksManager-VorgangsModul-Core'
}

{ #category : #testing }
ASDHMPageVorgang class >> isAbstract [

	^ self = ASDHMPageVorgang
]

{ #category : #accessing }
ASDHMPageVorgang class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDHMPageVorgang class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDHMPageVorgang class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDHMPageVorgang class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDHMPageVorgang >> children [
	^ {}
]

{ #category : #initialization }
ASDHMPageVorgang >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDHMPageVorgang >> pathName [
	^ self class pathName
]
