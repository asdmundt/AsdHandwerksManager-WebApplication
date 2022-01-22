Class {
	#name : #ASDHMInstallData,
	#superclass : #ASDHMInstall,
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #testing }
ASDHMInstallData class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]
