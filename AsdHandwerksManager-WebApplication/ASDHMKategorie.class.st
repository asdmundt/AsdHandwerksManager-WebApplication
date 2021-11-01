Class {
	#name : #ASDHMKategorie,
	#superclass : #ASDHMModel,
	#instVars : [
		'name',
		'type',
		'types'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDHMKategorie class >> name: aName andType: aString [
	^ self new
		name: aName;
		type: aString;
		yourself
]

{ #category : #accessing }
ASDHMKategorie >> name [
	^ name
]

{ #category : #accessing }
ASDHMKategorie >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASDHMKategorie >> type [
	^ type
]

{ #category : #accessing }
ASDHMKategorie >> type: anObject [
	type := anObject
]

{ #category : #accessing }
ASDHMKategorie >> types [
	^ OrderedCollection
		newFrom: {'ArbeitsartenOberKategorie' . 'Arbeitsarten' . 'MaterialOberKategorie' . 'MaterialKategorie'.'TelefonNrArten'.'AdressBezeichnungen'}.
]
