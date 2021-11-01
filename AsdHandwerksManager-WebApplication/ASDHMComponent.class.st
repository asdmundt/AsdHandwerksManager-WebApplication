"
Description
--------------------

Abstract superclass of all Seaside components of HandwerksManager. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #ASDHMComponent,
	#superclass : #WAComponent,
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #convenience }
ASDHMComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
ASDHMComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
ASDHMComponent >> rootComponent [
	^ self session rootComponent
]
