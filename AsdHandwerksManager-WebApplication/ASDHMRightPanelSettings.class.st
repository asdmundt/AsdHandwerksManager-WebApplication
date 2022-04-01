Class {
	#name : #ASDHMRightPanelSettings,
	#superclass : #ASDHMBaseComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMRightPanelSettings >> renderContentOn: html [

	html div
		id: #settingsPanel;
		with: [ 
			html render: 'This is the first panel' "self renderTabsOn: html" ]
]
