Class {
	#name : #ASDHMItemView,
	#superclass : #ASDHMBaseComponent,
	#instVars : [
		'visible'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #rendering }
ASDHMItemView >> renderHeadingOn: html [
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

{ #category : #accessing }
ASDHMItemView >> visible [

	^ visible
]

{ #category : #accessing }
ASDHMItemView >> visible: anObject [

	^ visible := anObject
]
