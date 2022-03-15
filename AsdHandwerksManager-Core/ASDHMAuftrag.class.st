Class {
	#name : #ASDHMAuftrag,
	#superclass : #ASDHMModel,
	#instVars : [
		'kunde',
		'baustellenAddresse',
		'arbeiten',
		'angebot',
		'technischeBeschreibung',
		'startauftrag',
		'endeAuftrag'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #voyage }
ASDHMAuftrag class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMAuftrag >> angebot [

	^ angebot
]

{ #category : #accessing }
ASDHMAuftrag >> angebot: anObject [

	angebot := anObject
]

{ #category : #accessing }
ASDHMAuftrag >> arbeiten [

	^ arbeiten
]

{ #category : #accessing }
ASDHMAuftrag >> arbeiten: anObject [

	arbeiten := anObject
]

{ #category : #accessing }
ASDHMAuftrag >> baustellenAddresse [

	^ baustellenAddresse
]

{ #category : #accessing }
ASDHMAuftrag >> baustellenAddresse: anObject [

	baustellenAddresse := anObject
]

{ #category : #accessing }
ASDHMAuftrag >> endeAuftrag [

	^ endeAuftrag
]

{ #category : #accessing }
ASDHMAuftrag >> endeAuftrag: anObject [

	endeAuftrag := anObject
]

{ #category : #initialization }
ASDHMAuftrag >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMAuftrag >> kunde [

	^ kunde
]

{ #category : #accessing }
ASDHMAuftrag >> kunde: anObject [

	kunde := anObject
]

{ #category : #accessing }
ASDHMAuftrag >> startauftrag [

	^ startauftrag
]

{ #category : #accessing }
ASDHMAuftrag >> startauftrag: anObject [

	startauftrag := anObject
]

{ #category : #accessing }
ASDHMAuftrag >> technischeBeschreibung [

	^ technischeBeschreibung
]

{ #category : #accessing }
ASDHMAuftrag >> technischeBeschreibung: anObject [

	technischeBeschreibung := anObject
]
