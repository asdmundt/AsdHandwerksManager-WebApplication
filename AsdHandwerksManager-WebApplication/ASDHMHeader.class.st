"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #ASDHMHeader,
	#superclass : #ASDHMComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #accessing }
ASDHMHeader >> possiblePages [
	^ ASDHMPage pagesToDisplay
]

{ #category : #rendering }
ASDHMHeader >> renderContentOn: html [
	html mdlLayoutHeader
		waterfall;
		with: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: [ 
									html text: '    Material Design Lite for Seaside' ] ].
					html mdlLayoutSpacer.
					html text: '	Version ' , self rootComponent class version.
					self renderForkMeOnGithubOn: html ].
			self renderNavMenu: html ]
]

{ #category : #rendering }
ASDHMHeader >> renderNavMenu: html [
	html
		mdlLayoutTabBar: [ self possiblePages
				do: [ :aClass | 
					html mdlLayoutTab
						callback: [ self displayInstanceOf: aClass ];
						isActiveIf: aClass = self rootComponent componentToDisplay class;
						with: aClass pageName ] ]
]
