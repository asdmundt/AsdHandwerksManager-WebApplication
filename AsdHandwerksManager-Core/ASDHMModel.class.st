Class {
	#name : #ASDHMModel,
	#superclass : #Object,
	#instVars : [
		'status',
		'task',
		'states',
		'id',
		'dataModel',
		'bez',
		'userId',
		'displayString',
		'type',
		'types'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMModel class >> bez: aString [
	^ self new
		bez: aString;
		yourself
]

{ #category : #accessing }
ASDHMModel class >> states [ 
^ OrderedCollection
		newFrom: {'new' . 'accepted' . 'inProgress' . 'done' . 'problem'}.
]

{ #category : #accessing }
ASDHMModel >> bez [
	^ bez
]

{ #category : #accessing }
ASDHMModel >> bez: anObject [
	bez := anObject
]

{ #category : #accessing }
ASDHMModel >> dataModel [

	^ dataModel
]

{ #category : #accessing }
ASDHMModel >> dataModel: anObject [

	dataModel := anObject
]

{ #category : #accessing }
ASDHMModel >> displayString [

	^  String streamContents: [ :s | 
		  s
			  nextPutAll: self bez;
			  space;
			  nextPutAll: self status;
			  space
 ]
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
