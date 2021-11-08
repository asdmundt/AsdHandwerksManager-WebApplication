"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #ASDHMHeader,
	#superclass : #ASDHMComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #accessing }
ASDHMHeader >> possiblePages [
	self session isLogged
		ifTrue: [ self session currentUser isAdmin
				ifTrue: [ ^ ASDHMPageAdmin pagesToDisplay ]
				ifFalse: [ ^ ASDHMPageLogin pagesToDisplay ] ]
		ifFalse: [ ^ ASDHMPage pagesToDisplay ]
]

{ #category : #rendering }
ASDHMHeader >> renderButtonMenu: html [
html mdlAnchorButton
						icon;
						id: html nextId;
						openDialogWithId: self rootDialogOpenId;
						onClickUpdateRootDialogWith: [ :r | self renderDialogCreatePlayableOn: r ];
						with: [ html mdlIcon: 'library_add' ].
					html mdlTooltip
						for: html lastId;
						with: 'Add Playable'.
					html mdlAnchorButton
						icon;
						id: html nextId;
						callback: [ self session model import ];
						with: [ html mdlIcon: 'cloud_download' ].
					html mdlTooltip
						for: html lastId;
						with: 'Import'.
					html mdlAnchorButton
						icon;
						id: html nextId;
						callback: [ self session model export ];
						with: [ html mdlIcon: 'cloud_upload' ].
					html mdlTooltip
						for: html lastId;
						with: 'Export'.
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
					].
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
