"
Description
--------------------

TODO
"
Class {
	#name : #ASDHMHelloWorldPage,
	#superclass : #ASDHMPage,
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMHelloWorldPage class >> pageName [
	^ 'Hello world'
]

{ #category : #accessing }
ASDHMHelloWorldPage class >> priority [
	^ 1
]

{ #category : #rendering }
ASDHMHelloWorldPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
