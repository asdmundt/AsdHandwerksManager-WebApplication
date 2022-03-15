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
	#instVars : [
		'tooltipLabelopenRightPanel',
		'tooltipLabelCloseRightPanel'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #initalize }
ASDHMHeader >> initialize [

	super initialize.
	self tooltipLabelopenRightPanel: 'Rechtes Panel öffnen'.
	self tooltipLabelCloseRightPanel: 'Rechtes Panel schliessen'.
]

{ #category : #accessing }
ASDHMHeader >> possiblePages [
self session isLogged
		ifTrue: [ self session currentUser isAdmin
				ifTrue: [ ^ ASDHMPageAdmin pagesToDisplay ]
				ifFalse: [ ^ ASDHMPageLogin pagesToDisplay ] ]
		ifFalse: [ ^ ASDHMPage pagesToDisplay ]
		"self session isLogged
		ifTrue: [ASDHMPageAdmin pagesToDisplay]
		ifFalse: [ ^ ASDHMPage pagesToDisplay ]
	"
]

{ #category : #rendering }
ASDHMHeader >> renderAccountButtonOn: html [
	html
		mdlNavigation: [ html mdlButton icon
				id: #bottomLeftButton;
				with: [ html mdlIcon: #account_circle ].
			html mdlMenu
				bottomRight;
				for: #bottomLeftButton;
				with: [ html mdlMenuItem: 'Einstellungen'.
					html mdlMenuItem
						fullBleedDivider;
						with: 'Konto'.
					html mdlMenuItem
						disabled;
						with: 'Disabled Action'.
					html mdlMenuItem: 'Yet Another Action' ] ]
]

{ #category : #rendering }
ASDHMHeader >> renderAdminSwitchOn: html [
"	self session user isAdmin
		ifTrue: [ html mdlSwitchContainer
				rippleEffect;
				style: 'width: 150px;';
				for: html nextId;
				with: [ html mdlSwitch
						value: self session model jingleWithVideo;
						onClick:
							(html jQuery ajax
								callback: [ self session model
										jingleWithVideo: self session model jingleWithVideo not ]);
						id: html lastId.
					html mdlSwitchLabel: 'Jingle with video' ] ]"
]

{ #category : #rendering }
ASDHMHeader >> renderButtonMenu: html [

	self session isLogged ifFalse: [ ^ self ].
	"
html mdlAnchorButton
						icon;
						id: html nextId;
						openDialogWithId: self rootDialogOpenId;
						onClickUpdateRootDialogWith: [ :r | self renderDialogAccount: r ];
						with: [ html mdlIcon: 'account_circle' ].
					html mdlTooltip
						for: html lastId;
						with: 'Add Playable'."
	html mdlAnchorButton
		icon;
		id: html nextId;
		class: 'openNav';
		with: [ html mdlIcon: 'more_vert' ].
	html mdlTooltip
		for: html lastId;
		with: self tooltipLabelopenRightPanel
	"	html mdlAnchorButton
		icon;
		id: html nextId;
		class: 'closeNav';
		with: [ html mdlIcon: 'close_fullscreen' ].
	html mdlTooltip
		for: html lastId;
		with: self tooltipLabelCloseRightPanel"
]

{ #category : #rendering }
ASDHMHeader >> renderButtonsOn: html [

	self session isLogged ifTrue: [ 
		html mdlNavigation: [ 
			
			self renderAccountButtonOn: html.
			self renderButtonMenu: html.
			 ] ]
]

{ #category : #rendering }
ASDHMHeader >> renderContentOn: html [

	html mdlLayoutHeader with: [ "self renderDrawerOn: html"
		html mdlLayoutHeaderRow: [ 
			html mdlNavigationLink
				callback: [ "Just refresh" ];
				with: [ 
					html mdlLayoutTitle: [ 
							html text: ' Test   asdDelMundt HandwerksManager' ] ].
			html mdlLayoutSpacer.
			self rootComponent class development ifTrue: [ 
			html anchor
				callback: [ self show: (WAInspector current on: self session) ];
				with: 'Inspect Session' ].
			self renderButtonsOn: html
			"html text: '	Version ' , self rootComponent class version." ].
		self renderTabBarOn: html ]
]

{ #category : #rendering }
ASDHMHeader >> renderDrawerOn: html [

	self session isLogged ifFalse: [ ^ self ].
	html mdlLayoutDrawer: [ 
		html mdlLayoutTitle: 'Title'.
		html mdlNavigation: [ 
			self possiblePages do: [ :aClass | 
				html mdlNavigationLink
					beCurrentIf: aClass = self rootComponent componentToDisplay class;
					callback: [ self displayInstanceOf: aClass ];
					with: aClass pageName ] ] ]
]

{ #category : #rendering }
ASDHMHeader >> renderNavMenu: html [

	
	"	html mdlLayoutSpacer.
	html mdlNavigation: [ 
		1 to: 5 do: [ :i | html mdlNavigationLink: 'Link' ] ]"
]

{ #category : #rendering }
ASDHMHeader >> renderTabBarOn: html [

	html mdlLayoutTabBar: [ 
		self possiblePages do: [ :aClass | 
			html mdlLayoutTab
				callback: [ self displayInstanceOf: aClass ];
				isActiveIf: aClass = self rootComponent componentToDisplay class;
				with: aClass pageName ] ]
]

{ #category : #accessing }
ASDHMHeader >> tooltipLabelCloseRightPanel [

	^ tooltipLabelCloseRightPanel
]

{ #category : #accessing }
ASDHMHeader >> tooltipLabelCloseRightPanel: anObject [

	tooltipLabelCloseRightPanel := anObject
]

{ #category : #accessing }
ASDHMHeader >> tooltipLabelopenRightPanel [

	^ tooltipLabelopenRightPanel
]

{ #category : #accessing }
ASDHMHeader >> tooltipLabelopenRightPanel: anObject [

	tooltipLabelopenRightPanel := anObject
]
