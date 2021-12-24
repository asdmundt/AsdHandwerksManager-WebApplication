"
Basis Anwendung um Handwerks Aufträge zu verwalten. In diese Anwendung können noch diverse Erweiterungen installiert werden.

"
Class {
	#name : #ManifestAsdHandwerksManagerWebApplication,
	#superclass : #PackageManifest,
	#category : #'AsdHandwerksManager-WebApplication-Manifest'
}

{ #category : #'code-critics' }
ManifestAsdHandwerksManagerWebApplication class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ASDHMRoot #tryConnectionWithLogin:andPassword: #false)) #'2021-12-22T15:27:12.692767+01:00') )
]
