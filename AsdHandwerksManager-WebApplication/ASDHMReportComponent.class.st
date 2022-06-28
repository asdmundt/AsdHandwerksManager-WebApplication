Class {
	#name : #ASDHMReportComponent,
	#superclass : #MDLMAReport,
	#instVars : [
		'title'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initialization }
ASDHMReportComponent >> initialize [
	super initialize.
	self showBatch: true
]

{ #category : #rendering }
ASDHMReportComponent >> renderContentOn: html [

	super renderContentOn: html.
	html mdlCardActions with: [ 
		html anchor
			callback: [ self close ];
			with: [ html mdlButton raised with: 'Close' ] ]
]

{ #category : #accessing }
ASDHMReportComponent >> title [

	^ title
]

{ #category : #accessing }
ASDHMReportComponent >> title: anObject [

	title := anObject
]
