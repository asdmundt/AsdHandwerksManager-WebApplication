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
		'types',
		'pathString',
		'stepIndex',
		'currentStepIndex'
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

	^ OrderedCollection newFrom:
		  { 'neu'. 'accepted'. 'inProgress'. 'success'. 'failure'. 'problem' }
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
ASDHMModel >> currentStepIndex [

	^ currentStepIndex
]

{ #category : #accessing }
ASDHMModel >> currentStepIndex: anObject [

	currentStepIndex := anObject
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
	self  stepIndex: 0.
	self currentStepIndex: 0.
	self status: 'new'
]

{ #category : #accessing }
ASDHMModel >> pathString [
^ String streamContents: [ :s | 
		  s
			  nextPutAll: '/';
			  space;
			  nextPutAll: self bez;
			  space ]
	
]

{ #category : #accessing }
ASDHMModel >> pathString: anObject [

	pathString := anObject
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
ASDHMModel >> stepIndex [

	^ stepIndex
]

{ #category : #accessing }
ASDHMModel >> stepIndex: anObject [

	stepIndex := anObject
]

{ #category : #accessing }
ASDHMModel >> task [

	^ task
]

{ #category : #accessing }
ASDHMModel >> task: anObject [

	task := anObject
]

{ #category : #accessing }
ASDHMModel >> types [

	^ types
]

{ #category : #accessing }
ASDHMModel >> types: anObject [

	types := anObject
]

{ #category : #accessing }
ASDHMModel >> userId [

	^ userId
]

{ #category : #accessing }
ASDHMModel >> userId: anObject [

	userId := anObject
]
