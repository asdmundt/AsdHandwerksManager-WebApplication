Class {
	#name : #ASDHMAuftrag,
	#superclass : #ASDHMModel,
	#instVars : [
		'kunde',
		'baustelle',
		'arbeiten',
		'angebot'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMAuftrag class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMAuftrag class >> kunde: aCostumer [

	^ self new
		  kunde: aCostumer;
		  yourself
]

{ #category : #initialization }
ASDHMAuftrag >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMAuftrag >> kunde [

	^ kunde
]

{ #category : #accessing }
ASDHMAuftrag >> kunde: anObject [

	kunde := anObject
]
