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

{ #category : #actions }
ASDHMInstallConfig >> loadOwnCompany [
|model adresse bank eigFirma|
model := ASDHMDbModelBase current.
eigFirma := ASDHMEigeneFirma bez: 'Eigentümer Firma'. 


bank := ASDHMBank new. 
bank bankName: 'Commerzbank'.
bank iban: 'DE22500400000270867500'.
bank bic: 'COBADEFFXXX'.
bank kontoInhaber: ''.
bank bankObjectId: eigFirma id asString.
model storeObject: bank.

adresse := ASDHMAdresse bez: 'Firmen Adresse'. 
adresse str: 'Mühlstr.'.
adresse hsnr: '3'.
adresse plz: '65779'.
adresse ort: 'Kelkheim'.
adresse land: ''.
adresse bemerkung: ''.
adresse adresseObjectId: eigFirma id asString.
model storeObject: adresse.

eigFirma firmenName: 'Hoxha'.
eigFirma firmenForm: 'GmbH'.
eigFirma firmenSitz: 'Kelkheim'.
eigFirma amtsgerichtSitz: 'Königstein'.
eigFirma hre: '104487'.
eigFirma steuerNr: '0402366028t'.
eigFirma umsatzSteuer: ''.
eigFirma geschaeftsFuehrer: 'Hamit Hoxha'.
eigFirma addBankVerbindungen: bank.
eigFirma addAdresse: adresse.


model storeObject: eigFirma.



]
