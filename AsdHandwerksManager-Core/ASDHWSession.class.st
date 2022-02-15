"
Description
--------------------

Simple session for the HoxhaWebSite. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #ASDHWSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent'
	],
	#category : #'AsdHandwerksManager-Core-Traits'
}

{ #category : #accessing }
ASDHWSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
ASDHWSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
