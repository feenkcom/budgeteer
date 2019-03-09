Class {
	#name : #FkCurrency,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'Currencies'
	],
	#category : #Budgeteer
}

{ #category : #currencies }
FkCurrency class >> CHF [
	^ self currencies at: #CHF ifAbsentPut: [ self new name: #CHF ]
]

{ #category : #currencies }
FkCurrency class >> EUR [
	^ self currencies at: #EUR ifAbsentPut: [ self new name: #EUR ]
]

{ #category : #currencies }
FkCurrency class >> USD [
	^ self currencies at: #USD ifAbsentPut: [ self new name: #USD ]
]

{ #category : #accessing }
FkCurrency class >> currencies [
	^ Currencies ifNil: [ Currencies := Dictionary new ]
]

{ #category : #accessing }
FkCurrency class >> reset [
	Currencies := nil
]

{ #category : #accessing }
FkCurrency >> name [
	^ name
]

{ #category : #accessing }
FkCurrency >> name: anObject [
	name := anObject
]

{ #category : #printing }
FkCurrency >> printOn: stream [
	super printOn: stream.
	stream space.
	self name printOn: stream
]
