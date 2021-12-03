Trait {
	#name : #ASDHMTSplashScreen,
	#category : #'AsdHandwerksManager-WebApplication-Traits'
}

{ #category : #initialization }
ASDHMTSplashScreen >> initializeSplashScreen [
]

{ #category : #accessing }
ASDHMTSplashScreen >> msgId [
^ #msg
]

{ #category : #rendering }
ASDHMTSplashScreen >> renderMsgOn: html [

html div 
class: 'modal-content';
id: self msgId;
with:[]
]

{ #category : #rendering }
ASDHMTSplashScreen >> renderSplashOn: html [

html div 
class: 'modal';
id: self splashId;
with:[self renderMsgOn: html]
]

{ #category : #accessing }
ASDHMTSplashScreen >> splashId [
^ #splash
]

{ #category : #hooks }
ASDHMTSplashScreen >> style [
^'.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
border: 1px solid #343434 !important;
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}'
]
