Class {
	#name : #ASDHMErsteEbeneKategorie,
	#superclass : #ASDHMSuperKategorie,
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMErsteEbeneKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #initialization }
ASDHMErsteEbeneKategorie >> initialize [

	super initialize.
	self index: 1.
	"pathString := super pathString , ' / ' , self pathString."
	
	collectionClassName := 'ASDHMZweiteEbeneKategorie'
]
