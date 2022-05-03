Class {
	#name : #ASDHMCofigPage,
	#superclass : #ASDHMPageAdmin,
	#instVars : [
		'baseInstaller',
		'importInstaller'
	],
	#category : #'AsdHandwerksManager-WebApplication-Pages'
}

{ #category : #accessing }
ASDHMCofigPage class >> pageName [

	^ 'Konfiguration'
]

{ #category : #accessing }
ASDHMCofigPage class >> priority [
	^ 1
]

{ #category : #accessing }
ASDHMCofigPage >> baseInstaller [

	^ baseInstaller
]

{ #category : #accessing }
ASDHMCofigPage >> baseInstaller: anObject [

	baseInstaller := anObject
]

{ #category : #hooks }
ASDHMCofigPage >> children [

	^ Array with: importInstaller
]

{ #category : #accessing }
ASDHMCofigPage >> importInstaller [

	^ importInstaller
]

{ #category : #accessing }
ASDHMCofigPage >> importInstaller: anObject [

	importInstaller := anObject
]

{ #category : #initialization }
ASDHMCofigPage >> initialize [

	super initialize.

	"self baseInstaller: ASDHMInstallConfigView new."
	self importInstaller: ASDHMInstallDataView new.

	self session rootComponent header: ASDHMAdminHeader new
]

{ #category : #rendering }
ASDHMCofigPage >> renderContentOn: html [
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
ASDHMCofigPage >> renderInstallComponentOn: html [

	html div
		style: 'display: block; height:100%';
		shadow: 0;
		with: [ 
			html div
				class: 'titleBar';
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
ASDHMCofigPage >> renderListOn: html [

	| componentInstance components |
	html mdlList
		style: 'width: 100%';
		id: #installerList;
		with: [ 
			
			html mdlListItem: [ 
					html mdlListPrimaryContent: [ html render: self importInstaller ] ] ]
]
