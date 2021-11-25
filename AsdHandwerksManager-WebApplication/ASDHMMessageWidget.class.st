Class {
	#name : #ASDHMMessageWidget,
	#superclass : #MDLWidget,
	#instVars : [
		'hide'
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

{ #category : #javascript }
ASDHMMessageWidget >> progressScript: html [
	self flag: #todo.	"Cyril: I think we can clean a little this part. Maybe it should go partly in a javascript file"
	^ html document
		addLoadScript:
			('var interval' , id , ' = setInterval(function(){') js
				,
					(html jQuery getJson
						json: [ :json | 
							json
								object: [ json key: #progress value: ((100 * self progressionBlock value) asInteger min: 100) ] ];
						onSuccess:
							'if(arguments[0].progress >= 100) window.clearInterval(interval' , id
								,
									');
				document.querySelector(''#' , id
								, ''').MaterialProgress.setProgress(arguments[0].progress);')
				, (';}, ' , self refreshTime asMilliSeconds asString , ');') js
]

{ #category : #accessing }
ASDHMMessageWidget >> progressionBlock [
	^ progressionBlock
]

{ #category : #accessing }
ASDHMMessageWidget >> progressionBlock: aBlock [
	progressionBlock := aBlock
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

{ #category : #javascript }
ASDHMMessageWidget >> showScript: html [
	^ (html jQuery id: self id) show , (self progressScript: html)
]
