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

{ #category : #accessing }
ASDHMZweiteEbeneKategorie >> kuerzel [

	^ kuerzel
]
