"
Description
--------------------

Abstract superclass of all Seaside components of HandwerksManager. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #ASDHMComponent,
	#superclass : #WAComponent,
	#instVars : [
		'report'
	],
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #actions }
ASDHMComponent >> addSelf [
	self subclassResponsibility
]

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

{ #category : #convenience }
ASDHMComponent >> displayInstanceOfWithSessionState: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOfWithSessionState: aComponentClass
]

{ #category : #convenience }
ASDHMComponent >> displayInstanceOfWithSessionStateAndAdd: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent
		displayInstanceOfWithSessionStateAndAdd: aComponentClass
]

{ #category : #accessing }
ASDHMComponent >> report [

	^ report
]

{ #category : #accessing }
ASDHMComponent >> report: anObject [

	report := anObject
]

{ #category : #accessing }
ASDHMComponent >> rootComponent [
	^ self session rootComponent
]
