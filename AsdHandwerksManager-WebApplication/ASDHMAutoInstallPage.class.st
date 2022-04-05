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

	^ 'Konfiguration'
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

	self session rootComponent header: ASDHMAdminHeader new
]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderContentOn: html [
html div
		shadow: 2;
		style: 'display: flex;';
		with: [ 
			html div
				class: 'content';
				id: 'contentWithoutside';
				style: 'flex-grow: 1;';
				with: [ self renderInstallComponentOn: html ] ].
	html html: '<script type="text/javascript">'.
	html html: '	window.addEventListener("resize", jsResize);
							window.addEventListener("load", jsResize);'.
	html html: 'function jsResize() {'.
	html html: 'var ah 	= screen.availHeight;'.
	html html: 'var aw 	= screen.availWidth;'.
	html html: 'var mh 	= (ah - 400) + ''px'';'.
	html html: 'var th 	= (ah - 350) + ''px'';'.
	html html: 'var lw 	= (aw - 880) + ''px'';'.
	html html: 'var wlw 	= (aw - 200) + ''px'';'.
	html html:
		'document.getElementById("contentWithoutside").style.width = wlw;'.
	html html:
		'document.getElementById("contentWithoutside").style.height = th;
		}'.
	html html: '</script>'.

]

{ #category : #rendering }
ASDHMAutoInstallPage >> renderInstallComponentOn: html [

	html div
		style: 'display: block; height:100%';
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
					'width: 100%;min-height: 400px;overflow-y: auto; height:100%;';
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
