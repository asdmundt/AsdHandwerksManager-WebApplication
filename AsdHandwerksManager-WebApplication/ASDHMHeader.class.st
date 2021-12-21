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
	self session isLogged
		ifFalse: [ ^ self ].
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
ASDHMHeader >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ html mdlNavigation: [self renderButtonMenu: html.self renderAccountButtonOn: html ] ]
]

{ #category : #rendering }
ASDHMHeader >> renderContentOn: html [

	html mdlLayoutHeader
		
		with: [ 
			html mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ 
							html mdlLayoutTitle: [ html text: '    Hoxha HandwerksManager' ] ].
					html mdlLayoutSpacer.
					self renderButtonsOn: html
					"html text: '	Version ' , self rootComponent class version." ].
			html mdlLayoutHeaderRow: [ 
				html mdlLayoutSpacer.
				self renderNavMenu: html ] ].
	self renderDrawerOn: html
]

{ #category : #rendering }
ASDHMHeader >> renderDrawerOn: html [
self session isLogged
		ifFalse: [ ^ self ].
	html
		mdlLayoutDrawer: [ 
			html
				mdlNavigation: [ 
					self possiblePages
						do: [ :aClass | 
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

{ #category : #accessing }
ASDHMHeader >> style [
^'.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}'
]
