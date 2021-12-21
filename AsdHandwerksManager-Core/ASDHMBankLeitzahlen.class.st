Class {
	#name : #ASDHMBankLeitzahlen,
	#superclass : #ASDHMModel,
	#instVars : [
		'bankName',
		'plz',
		'blz',
		'ort',
		'bic',
		'bankNameKurz',
		'pruefZiffer'
	],
	#category : #'AsdHandwerksManager-Core-Model'
}

{ #category : #'instance creation' }
ASDHMBankLeitzahlen class >> bankName: aBankName [
	^ self new
		bankName: aBankName;
		yourself
]

{ #category : #'instance creation' }
ASDHMBankLeitzahlen class >> blz: aBlz bankName: aBankName plz: aPlz ort: aOrt bankNameKurz: abankNameKurz bic: aBic pruefZiffer: apruefZiffer [   
	^ self new
	blz: aBlz;
		bankName: aBankName;
		plz: aPlz;
		ort: aOrt;
		bankNameKurz: abankNameKurz;
		bic: aBic;
		pruefZiffer: apruefZiffer;
		yourself
]

{ #category : #voyage }
ASDHMBankLeitzahlen class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> bankName [

	^ bankName
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> bankName: anObject [

	bankName := anObject
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> bankNameKurz [

	^ bankNameKurz
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> bankNameKurz: anObject [

	bankNameKurz := anObject
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> bic [

	^ bic
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> bic: anObject [

	bic := anObject
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> blz [

	^ blz
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> blz: anObject [

	blz := anObject
]

{ #category : #initialization }
ASDHMBankLeitzahlen >> initialize [
	super initialize.
	
	
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> ort [

	^ ort
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> ort: anObject [

	ort := anObject
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> plz [

	^ plz
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> plz: anObject [

	plz := anObject
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> pruefZiffer [

	^ pruefZiffer
]

{ #category : #accessing }
ASDHMBankLeitzahlen >> pruefZiffer: anObject [

	pruefZiffer := anObject
]
