Class {
	#name : #ASDHMInstallerHeader,
	#superclass : #ASDHMHeader,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallerHeader >> renderContentOn: html [
	html mdlLayoutHeader
		waterfall;
		with: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: [ 
									html text: '    Installation der Software' ] ].
					html mdlLayoutSpacer.
					html text: '	Version ' , self session firma name.
					].
			self renderNavMenu: html ]
]

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
