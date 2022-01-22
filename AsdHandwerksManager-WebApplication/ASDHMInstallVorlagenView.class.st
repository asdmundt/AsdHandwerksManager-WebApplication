Class {
	#name : #ASDHMInstallVorlagenView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallVorlagenView >> renderInnerContentOn: html [

	html button
		class: 'collapsible';
		with: [  ].
	html div
		class: 'content';
		with: [  ]
]
