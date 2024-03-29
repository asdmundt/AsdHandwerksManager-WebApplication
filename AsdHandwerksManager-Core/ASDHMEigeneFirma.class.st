Class {
	#name : #ASDHMEigeneFirma,
	#superclass : #ASDHMFirma,
	#instVars : [
		'syncEmail',
		'syncEmailPwd',
		'angestellte',
		'accounts'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMEigeneFirma class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMEigeneFirma >> accounts [
^ accounts ifNil: [ accounts := OrderedCollection new ]

]

{ #category : #accessing }
ASDHMEigeneFirma >> addAccounts: anObject [

	accounts add: anObject
]

{ #category : #accessing }
ASDHMEigeneFirma >> addAngestellte: anObject [

	angestellte add: anObject
]

{ #category : #accessing }
ASDHMEigeneFirma >> angestellte [
^ angestellte ifNil: [ angestellte := OrderedCollection new ]

]

{ #category : #initialization }
ASDHMEigeneFirma >> initialize [

	super initialize.
	accounts := OrderedCollection new
]

{ #category : #accessing }
ASDHMEigeneFirma >> syncEmail [

	^ syncEmail
]

{ #category : #accessing }
ASDHMEigeneFirma >> syncEmail: anObject [

	syncEmail := anObject
]

{ #category : #accessing }
ASDHMEigeneFirma >> syncEmailPwd [

	^ syncEmailPwd
]

{ #category : #accessing }
ASDHMEigeneFirma >> syncEmailPwd: anObject [

	syncEmailPwd := anObject
]
