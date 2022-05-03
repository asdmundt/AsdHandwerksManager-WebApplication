Class {
	#name : #ASDHMComponentBottomModal,
	#superclass : #MDLWidget,
	#instVars : [
		'component'
	],
	#category : #'AsdHandwerksManager-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDHMComponentBottomModal class >> withComponent: aComponent [

	^ self new component: aComponent;
		  yourself
]

{ #category : #'as yet unclassified' }
ASDHMComponentBottomModal >> component [

	^ component
]

{ #category : #'as yet unclassified' }
ASDHMComponentBottomModal >> component: anObject [

	component := anObject
]

{ #category : #initialization }
ASDHMComponentBottomModal >> initialize [

	super initialize.
	self id: #modalBody.
	
]

{ #category : #rendering }
ASDHMComponentBottomModal >> renderContentOn: html [

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
					html div
						class: 'modal-body';
						id: self id;
						with: [ html render: self component ] ] ]
]

{ #category : #hooks }
ASDHMComponentBottomModal >> script [

	^ '// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}'
]

{ #category : #hooks }
ASDHMComponentBottomModal >> style [

	^ '
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  -webkit-animation-name: fadeIn; /* Fade in the background */
  -webkit-animation-duration: 0.4s;
  animation-name: fadeIn;
  animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
  position: fixed;
  bottom: 0;
   border: 1px solid #161b22 !important;
    border-radius: 2px;
    background-color: #161b22 !important;
  width: 100%;
  -webkit-animation-name: slideIn;
  -webkit-animation-duration: 0.4s;
  animation-name: slideIn;
  animation-duration: 0.4s
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
  from {bottom: -300px; opacity: 0} 
  to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
  from {bottom: -300px; opacity: 0}
  to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}

@keyframes fadeIn {
  from {opacity: 0} 
  to {opacity: 1}
}'
]
