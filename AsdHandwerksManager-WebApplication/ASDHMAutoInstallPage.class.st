Class {
	#name : #ASDHMAutoInstallPage,
	#superclass : #ASDHMPageInstall,
	#instVars : [
		'baseInstaller',
		'importInstaller'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMAutoInstallPage class >> pageName [
	^ 'AutoInstallation'
]

{ #category : #accessing }
ASDHMAutoInstallPage class >> priority [
	^ 1
]

{ #category : #accessing }
ASDHMAutoInstallPage >> baseInstaller [

	^ baseInstaller
]

{ #category : #accessing }
ASDHMAutoInstallPage >> baseInstaller: anObject [

	baseInstaller := anObject
]

{ #category : #hooks }
ASDHMAutoInstallPage >> children [

	
		^ Array with: baseInstaller with: importInstaller
]

{ #category : #accessing }
ASDHMAutoInstallPage >> importInstaller [

	^ importInstaller
]

{ #category : #accessing }
ASDHMAutoInstallPage >> importInstaller: anObject [

	importInstaller := anObject
]

{ #category : #initialization }
ASDHMAutoInstallPage >> initialize [

	super initialize.
	self baseInstaller: ASDHMInstallConfigView new.
	self importInstaller: ASDHMInstallDataView new.
	
	self session rootComponent header: ASDHMAdminHeader new.
	
]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderContentOn: html [
	html mdlGrid
		noSpacing;
		with: [ 
			html mdlCell
				class: 'rootComponent';
				size: 12;
				with: [ 
					html div
						class: 'container';
						with: [ 
							html div
								class: 'center';
								with: [ self renderInstallComponentOn: html ] ] ] ]
	
]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderInstallComponentOn: html [

	html div
		class: 'asdContainer';
		shadow: 0;
		with: [ 
			html div
				class: 'bar';
				with: [ 
					html div
						class: 'wrapper';
						with: [ 
							html mdlButton icon
								id: #bottomRightButton;
								with: [ html mdlIcon: #more_vert ].
							html mdlMenu
								bottomRight;
								for: #bottomRightButton;
								with: [ 
									html mdlMenuItem: 'Some Action'.
									html mdlMenuItem
										fullBleedDivider;
										with: 'Another Action'.
									html mdlMenuItem
										disabled;
										with: 'Disabled Action'.
									html mdlMenuItem: 'Yet Another Action' ] ] ].
			html div
				class: 'background';
				style:
					'width: 100%;min-width: 0px;overflow-y: scroll;height: 400px;';
				with: [ self renderListOn: html ] ]
]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderListOn: html [

	| componentInstance components |
	html mdlList
		style: 'width: 100%';
		id: #installerList;
		with: [ 
								html mdlListItem: [ 
							html mdlListPrimaryContent: [ 
									html render: self baseInstaller ] ].
					html mdlListItem: [ 
							html mdlListPrimaryContent: [ 
									html render: self importInstaller ] ] ]
]
