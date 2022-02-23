Class {
	#name : #ASDHMSuperKategorie,
	#superclass : #ASDHMModel,
	#instVars : [
		'childs',
		'kuerzel',
		'index',
		'endIndex'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMSuperKategorie class >> bez: aString andKuerzel: aThreeDigit [

^ self new
		  bez: aString;
		 kuerzel: aThreeDigit;
		  yourself
]

{ #category : #voyage }
ASDHMSuperKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #actions }
ASDHMSuperKategorie >> addChilds: aChild [
childs add: aChild 
	
]

{ #category : #accessing }
ASDHMSuperKategorie >> childs [

	^ childs
]

{ #category : #accessing }
ASDHMSuperKategorie >> childs: anObject [

	childs := anObject
]

{ #category : #accessing }
ASDHMSuperKategorie >> endIndex [

	^ endIndex
]

{ #category : #accessing }
ASDHMSuperKategorie >> endIndex: anObject [

	endIndex := anObject
]

{ #category : #accessing }
ASDHMSuperKategorie >> index [

	^ index
]

{ #category : #accessing }
ASDHMSuperKategorie >> index: anObject [

	index := anObject
]

{ #category : #initialization }
ASDHMSuperKategorie >> initialize [

	super initialize.
	self index: 0.
	childs := OrderedCollection new. 
]

{ #category : #accessing }
ASDHMSuperKategorie >> kuerzel [

	^ kuerzel
]

{ #category : #accessing }
ASDHMSuperKategorie >> kuerzel: anObject [

	kuerzel := anObject
]
