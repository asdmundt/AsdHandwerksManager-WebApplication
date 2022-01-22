Class {
	#name : #ASDHMInstallDataView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallDataView >> renderInnerContentOn: html [

	html button
		class: 'collapsible';
		with: [  ].
	html div
		class: 'content';
		with: [  ]
]
