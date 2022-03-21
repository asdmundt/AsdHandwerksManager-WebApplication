Class {
	#name : #ASDHMObjectViewListKontakteComponent,
	#superclass : #ASDHMObjectViewListBaseComponent,
	#instVars : [
		'labelLeistungsBeschreibung',
		'labelEinheit',
		'labelPreis',
		'labelZeitProEinheit',
		'artikelId',
		'labelKategorieKuerzel',
		'kuerzel'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMObjectViewListKontakteComponent >> initialize [

	super initialize.
	self id: #listKontakte
]
