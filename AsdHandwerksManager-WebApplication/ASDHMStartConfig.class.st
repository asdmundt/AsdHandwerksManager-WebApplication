Class {
	#name : #ASDHMStartConfig,
	#superclass : #WAComponent,
	#instVars : [
		'status',
		'msgId',
		'model'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #accessing }
ASDHMStartConfig class >> states [ 
^ OrderedCollection
		newFrom: {'new' . 'accepted' . 'inProgress' . 'done' . 'problem'}.
]

{ #category : #initalize }
ASDHMStartConfig >> initialize [
	super initialize.
	self model: self session model.
	status:= 'new'
]

{ #category : #accessing }
ASDHMStartConfig >> model [

	^ model
]

{ #category : #accessing }
ASDHMStartConfig >> model: anObject [

	model := anObject
]

{ #category : #accessing }
ASDHMStartConfig >> msgId [

	^ msgId
]

{ #category : #accessing }
ASDHMStartConfig >> msgId: anObject [

	msgId := anObject
]

{ #category : #accessing }
ASDHMStartConfig >> status [

	^ status
]
