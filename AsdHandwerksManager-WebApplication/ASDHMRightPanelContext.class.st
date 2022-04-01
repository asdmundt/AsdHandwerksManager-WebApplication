Class {
	#name : #ASDHMRightPanelContext,
	#superclass : #ASDHMBaseComponent,
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMRightPanelContext >> renderContentOn: html [

	html div
		id: #contextPanel;
		with: [ 
			html render: 'This is the first panel' "self renderTabsOn: html" ]
]

{ #category : #rendering }
ASDHMRightPanelContext >> renderTabsOn: html [
	html
		render:
			(MDLTabWidget new
				addTabNamed: 'Tab 1' content: 'First tab';
				addTabNamed: 'Tab 2' content: 'Second tab';
				yourself)
]
