Class {
	#name : #ASDHMInstallerListcomponent,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'visible',
		'title',
		'components'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMInstallerListcomponent class >> withList: aList [
	^ self new
		components: aList

]

{ #category : #accessing }
ASDHMInstallerListcomponent >> components [

	^ components ifNil: [ components := OrderedCollection new ]
]

{ #category : #accessing }
ASDHMInstallerListcomponent >> components: anObject [

	components := anObject
]

{ #category : #initialization }
ASDHMInstallerListcomponent >> initialize [

	super initialize.
	self title: 'Basis Installation'.
	self components: OrderedCollection new
]

{ #category : #rendering }
ASDHMInstallerListcomponent >> renderContentOn: html [

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
ASDHMInstallerListcomponent >> renderHeadingOn: html [

	| helpId |
	helpId := html nextId.
	html heading
		class: 'helplink';
		onClick: ((html jQuery id: helpId) slideToggle: 1 seconds);
		onClick: (html jQuery ajax
				 id: helpId;
				 callback: [ visible := visible not ]);
		with: self title.
	html div
		id: helpId;
		class: 'help';
		style: (visible ifFalse: [ 'display: none' ]);
		with: 'The Enhanced ToDo application.'
]

{ #category : #rendering }
ASDHMInstallerListcomponent >> renderListOn: html [

	| componentInstance |
	html mdlList
		style: 'width: 100%';
		id: #installerList;
		with: [ 
			components do: [ :component | 
					"componentInstance := component new."
					html mdlListItem: [ 
							html mdlListPrimaryContent: [ html render: component new yourself  ] ] ] ]
]

{ #category : #accessing }
ASDHMInstallerListcomponent >> title [

	^ title
]

{ #category : #accessing }
ASDHMInstallerListcomponent >> title: anObject [

	title := anObject
]

{ #category : #accessing }
ASDHMInstallerListcomponent >> visible [

	^ visible
]

{ #category : #accessing }
ASDHMInstallerListcomponent >> visible: anObject [

	^ visible := anObject
]
