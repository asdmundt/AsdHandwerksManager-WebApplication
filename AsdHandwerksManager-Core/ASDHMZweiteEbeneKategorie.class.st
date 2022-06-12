Class {
	#name : #ASDHMZweiteEbeneKategorie,
	#superclass : #ASDHMSuperKategorie,
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMZweiteEbeneKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initialization }
ASDHMZweiteEbeneKategorie >> initialize [

	super initialize.
	self index: 2.
	pathString := super pathString , ' / ' , self pathString.
	collectionClassName := 'ASDHMKategorie'
]
