Class {
	#name : #ASDHMBaseComponent,
	#superclass : #MDLWidget,
	#instVars : [
		'model'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMBaseComponent class >> withModel: aModel [
	^ self new
		model: aModel
]

{ #category : #accessing }
ASDHMBaseComponent >> model [

	^ model
]

{ #category : #accessing }
ASDHMBaseComponent >> model: anObject [

	model := anObject
]
