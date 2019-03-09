Class {
	#name : #BuCurrencyMoney,
	#superclass : #BuMoney,
	#instVars : [
		'currency',
		'amount'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #'as yet unclassified' }
BuCurrencyMoney class >> CHF: aNumber [
	^ self new 
		amount: aNumber;
		currency: BuCurrency CHF
]

{ #category : #operations }
BuCurrencyMoney >> + other [
	[  other isKindOf: BuMoney ] assert.
	other isZero ifTrue: [ ^ self ].
	other currency = self currency ifTrue:
		[^ self class new amount: self amount + other amount; currency: self currency].
	^ nil
]

{ #category : #accessing }
BuCurrencyMoney >> = aMoney [
	^ (self isZero and: [ aMoney isZero ]) 
		or: [ 
			(aMoney amount = self amount) and: [ 
				aMoney currency = self currency ] ]
]

{ #category : #accessing }
BuCurrencyMoney >> amount [
	^ amount
]

{ #category : #accessing }
BuCurrencyMoney >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
BuCurrencyMoney >> currency [
	^ currency
]

{ #category : #accessing }
BuCurrencyMoney >> currency: anObject [
	currency := anObject
]

{ #category : #operations }
BuCurrencyMoney >> isZero [
	^ amount = 0
]

{ #category : #operations }
BuCurrencyMoney >> negative [
	^ self class new amount: 0 - self amount; currency: self currency
]

{ #category : #printing }
BuCurrencyMoney >> printOn: stream [
	stream 
		nextPutAll: self amount asString;
		space;
		nextPutAll: self currency name
]
