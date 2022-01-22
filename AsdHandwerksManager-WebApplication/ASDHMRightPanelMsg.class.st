Class {
	#name : #ASDHMRightPanelMsg,
	#superclass : #ASDHMBaseComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMRightPanelMsg >> renderContentOn: html [
	html div
		id: #msgPanel;
		with: [html render: 'This is the first panel' "self renderTabsOn: html" ]
]

{ #category : #rendering }
ASDHMRightPanelMsg >> renderTabsOn: html [
	html
		render:
			(MDLTabWidget new
				addTabNamed: 'Tab 1' content: 'First tab';
				addTabNamed: 'Tab 2' content: 'Second tab';
				yourself)
]
