"
Description
--------------------

A footer for the application with all the useful links.
"
Class {
	#name : #ASDHMFooter,
	#superclass : #ASDHMComponent,
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #accessing }
ASDHMFooter >> links [
	^ OrderedDictionary
		with: 'MDL for Seaside' -> 'https://github.com/DuneSt/MaterialDesignLite'
		with: 'Pharo' -> 'http://pharo.org/'
		with: 'Seaside' -> 'https://github.com/SeasideSt/Seaside'
]

{ #category : #rendering }
ASDHMFooter >> renderContentOn: html [
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'HandwerksManager'.
					html
						mdlMiniFooterLinkList: [ self links
								keysAndValuesDo: [ :label :url | 
									html
										listItem: [ html anchor
												url: url;
												with: label ] ] ] ].
			html mdlMiniFooterRightSection: [ html mdlMiniFooterLinkList: [ html listItem: [ html text: 'Contact: TODO' ] ] ] ]
]
