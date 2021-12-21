Class {
	#name : #ASDHMInstallerHeader,
	#superclass : #ASDHMHeader,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallerHeader >> renderNavMenu: html [
	html
		mdlLayoutTabBar: [ self possiblePages
				doWithIndex: [ :aClass | 
					html mdlLayoutTab
						callback: [ self displayInstanceOf: aClass ];
						isActiveIf: aClass = self rootComponent componentToDisplay class;
						with: aClass pageName ] ]
]
