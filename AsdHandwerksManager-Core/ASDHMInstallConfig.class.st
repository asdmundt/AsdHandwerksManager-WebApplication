Class {
	#name : #ASDHMInstallConfig,
	#superclass : #ASDHMInstall,
	#instVars : [
		'configName'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #accessing }
ASDHMInstallConfig class >> configName: aString [

	^ self new
		  configName: aString;
		  yourself
]

{ #category : #accessing }
ASDHMInstallConfig class >> isVoyageRoot [

	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMInstallConfig >> configName [

	^ configName
]

{ #category : #accessing }
ASDHMInstallConfig >> configName: anObject [

	configName := anObject
]

{ #category : #initalize }
ASDHMInstallConfig >> initialize [

	super initialize.
	
	
]
