Class {
	#name : #ASDHMInstallServicesView,
	#superclass : #ASDHMInstallerComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallServicesView >> renderInnerContentOn: html [

	html button
		class: 'collapsible';
		with: [  ].
	html div
		class: 'content';
		with: [  ]
]
