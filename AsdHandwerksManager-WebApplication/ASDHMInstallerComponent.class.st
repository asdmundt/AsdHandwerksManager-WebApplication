Class {
	#name : #ASDHMInstallerComponent,
	#superclass : #MDLWidget,
	#instVars : [
		'title',
		'components'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMInstallerComponent >> renderHeadingOn: html [
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
