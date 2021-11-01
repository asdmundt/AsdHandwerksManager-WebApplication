"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #ASDHMPage,
	#superclass : #ASDHMComponent,
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #testing }
ASDHMPage class >> isAbstract [
	^ self = ASDHMPage
]

{ #category : #accessing }
ASDHMPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDHMPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDHMPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDHMPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDHMPage >> pathName [
	^ self class pathName
]
