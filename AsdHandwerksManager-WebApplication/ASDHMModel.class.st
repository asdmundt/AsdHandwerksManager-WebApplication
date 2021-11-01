Class {
	#name : #ASDHMModel,
	#superclass : #Object,
	#instVars : [
		'status',
		'task',
		'states',
		'id',
		'dataModel'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #accessing }
ASDHMModel >> dataModel [

	^ dataModel
]

{ #category : #accessing }
ASDHMModel >> dataModel: anObject [

	dataModel := anObject
]

{ #category : #accessing }
ASDHMModel >> id [

	^ id
]

{ #category : #accessing }
ASDHMModel >> id: anObject [

	id := anObject
]

{ #category : #initalize }
ASDHMModel >> initialize [
	super initialize.
	self task: OrderedCollection new.
	self id: UUID new.
	states := OrderedCollection
		newFrom: {'new' . 'accepted' . 'inProgress' . 'done' . 'problem'}.
	self status: 'new'
]

{ #category : #accessing }
ASDHMModel >> states [

	^ states
]

{ #category : #accessing }
ASDHMModel >> status [

	^ status
]

{ #category : #accessing }
ASDHMModel >> status: anObject [

	status := anObject
]

{ #category : #accessing }
ASDHMModel >> task [

	^ task
]

{ #category : #accessing }
ASDHMModel >> task: anObject [

	task := anObject
]
