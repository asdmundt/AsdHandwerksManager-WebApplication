Class {
	#name : #ASDHMBauAbwicklungPage,
	#superclass : #ASDHMPageAdmin,
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMBauAbwicklungPage class >> pageName [
	^ 'Bauabwicklung'
]

{ #category : #accessing }
ASDHMBauAbwicklungPage class >> priority [

	^ 5
]

{ #category : #hooks }
ASDHMBauAbwicklungPage >> children [
	^ {  }
]

{ #category : #initialization }
ASDHMBauAbwicklungPage >> initialize [

super initialize.

	
	self session rootComponent header: ASDHMAdminHeader new.
	
	
]

{ #category : #rendering }
ASDHMBauAbwicklungPage >> renderContentOn: html [

	html object
		type: 'image/svg+xml' seasideMimeType;
		width: 512;
		height: 512;
		standby: 'loading tiger';
		url:
			'http://upload.wikimedia.org/wikipedia/commons/f/fd/Ghostscript_Tiger.svg';
		with: 'Your browser doesn''t support SVG'
]
