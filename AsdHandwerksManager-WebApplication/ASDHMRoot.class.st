"
Description
--------------------

I am the root component of HandwerksManager. I will contain every components of the application to display.

I have a header and a footer.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	componentInstances:			<aDictionary>	A dictionary keeping for each component class, an instance. This instance can be use when the user change of page to come pack to a previous page.
	componentToDisplay:		<aComponent>	The current page to display as the root content.
	footer:						<aComponent>	The footer of the page.
	header:						<aComponent>	The header of the page.

"
Class {
	#name : #ASDHMRoot,
	#superclass : #ASDHMComponent,
	#traits : 'TRootDialogRenderer',
	#classTraits : 'TRootDialogRenderer classTrait',
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'footer',
		'rightPanel'
	],
	#category : #'AsdHandwerksManager-WebApplication-Core'
}

{ #category : #testing }
ASDHMRoot class >> canBeRoot [
	^ true
]

{ #category : #testing }
ASDHMRoot class >> development [
	^ true
]

{ #category : #initialization }
ASDHMRoot class >> initialize [

	self environment
		at: #WADevelopmentConfiguration
		ifPresent: [ :class | 
		WAAdmin applicationDefaults addParent: class instance ]. "Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'HandwerksManager')
		  preferenceAt: #sessionClass put: ASDHMSession;
		  addLibrary: JQDeploymentLibrary;
		  addLibrary: JQUiDevelopmentLibrary;
		  addLibrary: MDLLibrary;
		addLibrary: MDCLibrary;
		  addLibrary: ASDHMLibrary;
		  yourself
]

{ #category : #'world menu' }
ASDHMRoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'HandwerksManager')
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ] ]
]

{ #category : #'instance creation' }
ASDHMRoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/HandwerksManager'
]

{ #category : #version }
ASDHMRoot class >> version [

	^ 'v0.1.1'
]

{ #category : #hooks }
ASDHMRoot >> children [

	^ { 
		  self header.
		  self componentToDisplay.
			self rightPanel.
		  self footer }
]

{ #category : #accessing }
ASDHMRoot >> componentInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ componentInstances
]

{ #category : #accessing }
ASDHMRoot >> componentInstances: aDictionary [
	componentInstances := aDictionary
]

{ #category : #accessing }
ASDHMRoot >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
ASDHMRoot >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
ASDHMRoot >> defaultFooter [
	^ ASDHMFooter new
]

{ #category : #components }
ASDHMRoot >> defaultHeader [
	^ ASDHMHeader new
]

{ #category : #updating }
ASDHMRoot >> displayInstanceOf: aComponentClass [
self session resetStates.
	self componentToDisplay: (self componentInstances
			 at: aComponentClass
			 ifAbsentPut: [ aComponentClass new ])
]

{ #category : #updating }
ASDHMRoot >> displayInstanceOfWithSessionState: aComponentClass [

	"self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])"

	self componentToDisplay: (self componentInstances
			 at: aComponentClass
			 ifAbsentPut: [ aComponentClass new ])
]

{ #category : #updating }
ASDHMRoot >> displayInstanceOfWithSessionStateAndAdd: aComponentClass [
	"self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])"

	self
		componentToDisplay:
			(self componentInstances
				at: aComponentClass
				ifPresent: [ aComponentClass new addSelf ]
				ifAbsentPut: [ aComponentClass new addSelf ])
]

{ #category : #accessing }
ASDHMRoot >> footer [
	^ footer
]

{ #category : #accessing }
ASDHMRoot >> footer: aComponent [
	footer := aComponent
]

{ #category : #action }
ASDHMRoot >> goToAuftragsView [

	self displayInstanceOf: ASDHMAuftragsVerwaltungPage 
]

{ #category : #action }
ASDHMRoot >> goToContactView [

	self displayInstanceOf: ASDHMContactPage 
]

{ #category : #action }
ASDHMRoot >> goToInstallView [

	self displayInstanceOf: ASDHMAutoInstallPage
]

{ #category : #action }
ASDHMRoot >> goToLeistungenView [

	self displayInstanceOf: ASDHMLeistungsBeschreibungPage 
]

{ #category : #action }
ASDHMRoot >> goToLoginView [
	self displayInstanceOf: ASDHMLoginPage 
]

{ #category : #action }
ASDHMRoot >> goToOverviewView [
	self displayInstanceOf: ASDHMHomePage 
]

{ #category : #accessing }
ASDHMRoot >> header [
	^ header
]

{ #category : #accessing }
ASDHMRoot >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
ASDHMRoot >> initialRequest: aRequest [
	| consumer pageName |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.
	
	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"
	
	"Try to find a page corresponding"
	self header possiblePages
		detect: [ :each | each pathName asLowercase = pageName ]
		ifFound: [ :class | 
			self displayInstanceOf: class.

			"If we find a page, we pop the subpart of the path corresponding to the page."
			consumer next ]
]

{ #category : #initialization }
ASDHMRoot >> initialize [

	super initialize.
	self header: self defaultHeader.
	self rightPanel: ASDHMComponentWithRightPanel new.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: self header possiblePages first
]

{ #category : #rendering }
ASDHMRoot >> renderBottomModalOn: html [

	html div
		class: 'modal';
		id: 'myModal';
		with: [ 
			html div
				class: 'modal-content';
				with: [ 
					html div
						class: 'modal-header';
						with: [ 
							html span
								class: 'close';
								with: [ html html: '&times;' ].
							html div
								class: 'mdl-typography--headline';
								with: 'Titel' ].
							
							 ] ]
]

{ #category : #rendering }
ASDHMRoot >> renderContentOn: html [

	
	html mdlLayout
		fixedHeader;
		with: [ 
			html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ 
					html mdlGrid
						noSpacing;
						with: [ "noSpacing;""html render: self footer"
							html mdlCell
								class: 'rootComponent';
								size: 12;
								stretch;
								with: [ 
									html div
										id: #main;
										with: [ html render: self componentToDisplay ].
									html render: self rightPanel ] ] ] ].
	self renderEmptyGenericDialogOn: html
]

{ #category : #accessing }
ASDHMRoot >> rightPanel [

	^ rightPanel
]

{ #category : #accessing }
ASDHMRoot >> rightPanel: anObject [

	rightPanel := anObject
]

{ #category : #action }
ASDHMRoot >> tryConnectionWithLogin: login andPassword: password [

	| user users |
	users := self session model users.
	"self halt."
	users size < 1
		ifFalse: [ 
			user := self session model
				        userFromLogin: login
				        andPassword: password.
			"self halt."
			user
				ifNotNil: [ :arg | 
					arg logged: true.

					self session currentUser: arg.
					self session userId: arg id.
					"arg logged: true."
					self session model addLoggedUser: arg.
					self session firma: self session model eigeneFirma.
					self goToOverviewView
					"arg isAdmin
				ifTrue: [ self goToAdminView ]
				ifFalse: [ self goToOverviewView ]" ]
				ifNil: [ 
					self session loginError:
						'Ihre Benutzer Eingaben konnten nicht zugeordnet werden'.
					self goToLoginView ] ]
		ifTrue: [ self goToInstallView ]
]

{ #category : #updating }
ASDHMRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Application example for MDL.'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'
]

{ #category : #updating }
ASDHMRoot >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
