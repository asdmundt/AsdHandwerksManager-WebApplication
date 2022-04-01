Class {
	#name : #ASDHMRightPanelVorgang,
	#superclass : #ASDHMBaseComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMRightPanelVorgang >> renderContentOn: html [

	html div
		id: #vorgangsPanel;
		with: [ 
			html render: 'This is the first panel' "self renderTabsOn: html" ]
]

{ #category : #rendering }
ASDHMRightPanelVorgang >> renderTabsOn: html [
	html
		render:
			(MDLTabWidget new
				addTabNamed: 'Tab 1' content: 'First tab';
				addTabNamed: 'Tab 2' content: 'Second tab';
				yourself)
]
