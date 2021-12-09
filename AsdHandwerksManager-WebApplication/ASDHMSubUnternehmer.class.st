Class {
	#name : #ASDHMSubUnternehmer,
	#superclass : #ASDHMFirma,
	#instVars : [
		'syncEmail',
		'syncEmailPwd',
		'angestellte',
		'accounts'
	],
	#category : #'AsdHandwerksManager-WebApplication-Model'
}

{ #category : #accessing }
ASDHMSubUnternehmer class >> titleText [
^'Subunternehmer'
]
