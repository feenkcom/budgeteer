Class {
	#name : #BuCurrency,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'Currencies'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #currencies }
BuCurrency class >> CHF [
	^ self currencies at: #CHF ifAbsentPut: [ self new name: #CHF ]
]

{ #category : #currencies }
BuCurrency class >> EUR [
	^ self currencies at: #EUR ifAbsentPut: [ self new name: #EUR ]
]

{ #category : #currencies }
BuCurrency class >> USD [
	^ self currencies at: #USD ifAbsentPut: [ self new name: #USD ]
]

{ #category : #accessing }
BuCurrency class >> currencies [
	^ Currencies ifNil: [ Currencies := Dictionary new ]
]

{ #category : #accessing }
BuCurrency class >> reset [
	Currencies := nil
]

{ #category : #testing }
BuCurrency >> = aCurrency [
	^ self name = aCurrency name
]

{ #category : #accessing }
BuCurrency >> name [
	^ name
]

{ #category : #accessing }
BuCurrency >> name: anObject [
	name := anObject
]

{ #category : #printing }
BuCurrency >> printOn: stream [
	super printOn: stream.
	stream space.
	self name printOn: stream
]
