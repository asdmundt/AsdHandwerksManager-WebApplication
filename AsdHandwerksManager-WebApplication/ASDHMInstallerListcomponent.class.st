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

	^ components
]

{ #category : #accessing }
ASDHMInstallerListcomponent >> components: anObject [

	components := anObject
]

{ #category : #initialization }
ASDHMInstallerListcomponent >> initialize [
	super initialize.
	
]

{ #category : #rendering }
ASDHMInstallerListcomponent >> renderContentOn: html [
self renderHeadingOn: html.
self renderListOn: html
]

{ #category : #rendering }
ASDHMInstallerListcomponent >> renderHeadingOn: html [
| helpId |
    helpId := html nextId.
    (html heading)
        class: 'helplink';
        onClick: ((html jQuery id: helpId)
            slideToggle: 1 seconds);
        onClick: ((html jQuery ajax)
            id: helpId;
            callback: [visible := visible not]);
        with: self model title.
    (html div)
        id: helpId;
        class: 'help';
        style: (visible ifFalse: ['display: none']);
        with: 'The Enhanced ToDo application.'
]

{ #category : #rendering }
ASDHMInstallerListcomponent >> renderListOn: html [
html mdlList
		style: 'width: 300px';
		with: [ self components
				do: [ :name | 
					html
						mdlListItem: [ html
								mdlListPrimaryContent: [ html mdlIcon
										listItemAvatar;
										with: #person.
									html text: name ].
							html mdlListItemSecondaryAction
								url: '#';
								with: [ html mdlIcon: #star ] ] ] ]
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
