Class {
	#name : #ASDHMBaustelle,
	#superclass : #ASDHMModel,
	#instVars : [
		'kunde'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMBaustelle class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMBaustelle class >> kontoInhaber: aString [
	^ self new
		kontoInhaber: aString;
		yourself
]

{ #category : #initialization }
ASDHMBaustelle >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMBaustelle >> kunde [

	^ kunde
]

{ #category : #accessing }
ASDHMBaustelle >> kunde: anObject [

	kunde := anObject
]
