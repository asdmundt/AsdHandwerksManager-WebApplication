Class {
	#name : #ASDHMKategorie,
	#superclass : #ASDHMSuperKategorie,
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initialization }
ASDHMKategorie >> initialize [

	super initialize.
	self index: 3.
	"pathString := super pathString , ' / ' , self pathString."
	collectionClassName := false
]
