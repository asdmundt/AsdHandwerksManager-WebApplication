Class {
	#name : #ASDHMInstall,
	#superclass : #ASDHMModel,
	#instVars : [
		'msgId',
		'title'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMInstall class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMInstall class >> states [

	^ OrderedCollection newFrom:
		  { 'new'. 'inProgress'. 'done'. 'problem' }
]

{ #category : #initalize }
ASDHMInstall >> initialize [

	super initialize.

	
]

{ #category : #accessing }
ASDHMInstall >> msgId [

	^ msgId
]

{ #category : #accessing }
ASDHMInstall >> msgId: anObject [

	msgId := anObject
]

{ #category : #accessing }
ASDHMInstall >> status [

	^ status
]
