Class {
	#name : #FkMoney,
	#superclass : #Object,
	#instVars : [
		'currency',
		'amount'
	],
	#category : #Budgeteer
}

{ #category : #'as yet unclassified' }
FkMoney class >> CHF: aNumber [
	^ self new 
		amount: aNumber;
		currency: FkCurrency CHF
]

{ #category : #operations }
FkMoney >> + other [
	[  other isKindOf: FkMoney ] assert.
	other = 0 ifTrue: [^ self].
	other currency = self currency ifTrue:
		[^ self class new amount: self amount + other amount; currency: self currency].
	^ nil "MoneyBag new
		add: other;
		add: self;
		yourself"
]

{ #category : #accessing }
FkMoney >> amount [
	^ amount
]

{ #category : #accessing }
FkMoney >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
FkMoney >> currency [
	^ currency
]

{ #category : #accessing }
FkMoney >> currency: anObject [
	currency := anObject
]

{ #category : #operations }
FkMoney >> negative [
	^ self class new amount: 0 - self amount; currency: self currency
]

{ #category : #printing }
FkMoney >> printOn: stream [
	stream 
		nextPutAll: self amount asString;
		space;
		nextPutAll: self currency name
]
