Class {
	#name : #ASDHMEigeneFirma,
	#superclass : #ASDHMFirma,
	#instVars : [
		'syncEmail',
		'syncEmailPwd'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #voyage }
ASDHMEigeneFirma class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
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
