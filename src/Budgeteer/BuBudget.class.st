Class {
	#name : #BuBudget,
	#superclass : #Object,
	#instVars : [
		'items',
		'endDate',
		'startDate'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #accessing }
BuBudget >> add: anEntry [
	items add: anEntry
]

{ #category : #accessing }
BuBudget >> addItem: anItem [
	self items add: anItem
]

{ #category : #api }
BuBudget >> daysAndMoneyUntil: aDate [
	| daysAndMoney money currentDate groupedTransactions |
	daysAndMoney := OrderedCollection new.
	money := 0 CHF.
	currentDate := self initial paymentDate.
	groupedTransactions := ((self relevantTransactions asOrderedCollection groupedBy: [:each | each paymentDate]) associations select: [:assoc | assoc key >= currentDate]) asDictionary.
	[ currentDate <= aDate ] whileTrue: [ 
		groupedTransactions at: currentDate ifPresent: [ :dailyTransactions | 
			money := dailyTransactions 
						inject: money 
						into: [ :previousValue :each | previousValue + (each effectiveMoney) ].
			]. 
		daysAndMoney add: currentDate -> money copy.
		currentDate := currentDate + 1 day.
	 ].
	^ daysAndMoney
]

{ #category : #accessing }
BuBudget >> endDate [
	^ endDate
]

{ #category : #accessing }
BuBudget >> endDate: anObject [
	endDate := anObject
]

{ #category : #initialize }
BuBudget >> initialize [
	items := OrderedCollection new
]

{ #category : #accessing }
BuBudget >> items [
	^ items
]

{ #category : #accessing }
BuBudget >> items: anObject [
	items := anObject
]

{ #category : #api }
BuBudget >> moneyOn: aDate [
	^ (self relevantTransactions select: [ :each | each paymentDate <= aDate ])
		inject: self initial effectiveMoney into: [ :previousValue :each |  previousValue + (each effectiveMoney) ].
]

{ #category : #'as yet unclassified' }
BuBudget >> relevantBudgetPerMonth [
	| relevantTransactions |
	relevantTransactions := (self relevantTransactions asOrderedCollection groupedBy: [ :each | each paymentDate month ]) associations sorted: [ :a :b | a key < b key ].
	^ relevantTransactions collect: [ :association |
		| budget |
		budget := self class new.
		budget transactions: association value.
		association key -> budget ]
]

{ #category : #accessing }
BuBudget >> relevantTransactions [
	| transactions |
	transactions := BuTransactionGroup new.
	self items do: [ :anEntry |
		anEntry
			transactionsFromDate: startDate 
			toDate: endDate 
			do: [ :aTransaction | transactions add: aTransaction ] ].
	^ transactions	
	

]

{ #category : #'as yet unclassified' }
BuBudget >> relevantTransactionsPerMonths [
	^ (self relevantTransactions asOrderedCollection groupedBy: [ :each | each paymentDate month ]) associations sorted: [ :a :b | a key < b key ]
]

{ #category : #accessing }
BuBudget >> startDate [
	^ startDate
]

{ #category : #accessing }
BuBudget >> startDate: anObject [
	startDate := anObject
]
