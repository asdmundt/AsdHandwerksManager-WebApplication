"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #ASDHMHeader,
	#superclass : #ASDHMComponent,
	#category : #'AsdHandwerksManager-WebApplication-Core'
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
								mdlLayoutTitle: 'Application example for MDL.' ].
					html mdlLayoutSpacer.
					html text: 'Version 0.0.0'. ].
			html
				mdlLayoutTabBar: [ self possiblePages
						do: [ :aClass | 
							html mdlLayoutTab
								callback: [ self displayInstanceOf: aClass ];
								isActiveIf: aClass = self rootComponent componentToDisplay class;
								with: aClass pageName ] ] ]
]
