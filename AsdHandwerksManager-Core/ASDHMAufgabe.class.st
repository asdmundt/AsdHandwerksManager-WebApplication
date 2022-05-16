Class {
	#name : #ASDHMAufgabe,
	#superclass : #ASDHMModel,
	#instVars : [
		'userErsteller',
		'title',
		'descr',
		'userZiel',
		'completed',
		'deadline'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #accessing }
ASDHMAufgabe >> completed [

	^ completed
]

{ #category : #accessing }
ASDHMAufgabe >> completed: anObject [

	completed := anObject
]

{ #category : #accessing }
ASDHMAufgabe >> deadline [

	^ deadline
]

{ #category : #accessing }
ASDHMAufgabe >> deadline: anObject [

	deadline := anObject
]

{ #category : #accessing }
ASDHMAufgabe >> descr [

	^ descr
]

{ #category : #accessing }
ASDHMAufgabe >> descr: anObject [

	descr := anObject
]

{ #category : #'accessing - testing' }
ASDHMAufgabe >> hasAccepted [

	^ self userZiel isNotNil
]

{ #category : #'accessing - testing' }
ASDHMAufgabe >> hasBeenMissed [

 ^ self completed not and: [self deadline < Date today]
]

{ #category : #'accessing - testing' }
ASDHMAufgabe >> hasNotAccepted [

	^ 
		  self userZiel isNil
]

{ #category : #initialization }
ASDHMAufgabe >> initialize [

	super initialize.
	self
  deadline: Date tomorrow;
  completed: false.
]

{ #category : #'accessing - testing' }
ASDHMAufgabe >> isPending [

 ^ self completed not and: [self deadline >= Date today]
]

{ #category : #accessing }
ASDHMAufgabe >> title [

	^ title
]

{ #category : #accessing }
ASDHMAufgabe >> title: anObject [

	title := anObject
]

{ #category : #accessing }
ASDHMAufgabe >> userErsteller [

	^ userErsteller
]

{ #category : #accessing }
ASDHMAufgabe >> userErsteller: anObject [

	userErsteller := anObject
]

{ #category : #accessing }
ASDHMAufgabe >> userZiel [

	^ userZiel
]

{ #category : #accessing }
ASDHMAufgabe >> userZiel: anObject [

	userZiel := anObject
]
