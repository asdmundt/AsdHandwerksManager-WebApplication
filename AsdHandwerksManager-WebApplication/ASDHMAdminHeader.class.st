Class {
	#name : #ASDHMAdminHeader,
	#superclass : #ASDHMHeader,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMAdminHeader >> renderContentOn: html [
	html mdlLayoutHeader
		waterfall;
		with: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: [ 
									html text: '    Einrichtung der Firma' ] ].
					html mdlLayoutSpacer.
					html text: '	Version ' , self session firma name.
					].
			self renderNavMenu: html ]
]
