Class {
	#name : #ASDHMKategorie,
	#superclass : #ASDHMModel,
	#instVars : [
		'type'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMKategorie class >> bez: aName andType: aString [

	^ self new
		  bez: aName;
		  type: aString;
		  yourself
]

{ #category : #voyage }
ASDHMKategorie class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMKategorie class >> types [
	^ OrderedCollection
		newFrom: {'ArbeitsartenOberKategorie' . 'Arbeitsarten' . 'MaterialOberKategorie' . 'MaterialKategorie'. 'MaterialArtKategorie'.'TelefonNrArten'.'AdressBezeichnungen Warengruppen'}.
]

{ #category : #accessing }
ASDHMKategorie >> type [
	^ type
]

{ #category : #accessing }
ASDHMKategorie >> type: anObject [
	type := anObject
]
