Class {
	#name : #ASDHMMessageWidget,
	#superclass : #MDLWidget,
	#instVars : [
		'hide',
		'refreshTime'
	],
	#category : #'AsdHandwerksManager-WebApplication-Widgets'
}

{ #category : #'instance creation' }
ASDHMMessageWidget class >> open [
	^ self new
		hidden: false;
		yourself
]

{ #category : #options }
ASDHMMessageWidget >> hidden [
	self hide: true
]

{ #category : #accessing }
ASDHMMessageWidget >> hide [
	^ hide
]

{ #category : #accessing }
ASDHMMessageWidget >> hide: aBoolean [
	hide := aBoolean
]

{ #category : #initialization }
ASDHMMessageWidget >> initialize [
	super initialize.
	self refreshTime: 1 seconds.
	self hide: false
]

{ #category : #accessing }
ASDHMMessageWidget >> refreshTime [
	^ refreshTime
]

{ #category : #accessing }
ASDHMMessageWidget >> refreshTime: aDuration [
	refreshTime := aDuration
]

{ #category : #rendering }
ASDHMMessageWidget >> renderContentOn: html [
	self ensureId: html.
	html div
		style: 'margin: auto;' , (self hide ifTrue: [ 'display: none;' ] ifFalse: [ '' ]);
		id: id.
	self hide ifFalse: [ self progressScript: html ]
]
