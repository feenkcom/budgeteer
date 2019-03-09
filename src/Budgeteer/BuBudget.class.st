Class {
	#name : #BuBudget,
	#superclass : #Object,
	#instVars : [
		'businessItems'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #accessing }
BuBudget >> add: aTransaction [
	self transactions add: aTransaction
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

{ #category : #api }
BuBudget >> expense: aString money: aMoney on: aDate [
	self add: (FkExpense new comment: aString; money: aMoney; paymentDate: aDate)
]

{ #category : #ui }
BuBudget >> gtInspectorTransactionsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite fastTable
		title: 'Transactions';
		display: [ self relevantTransactions ];
		column: 'Date' evaluated: [ :each | each paymentDate ] width: 110;
		column: 'Money' evaluated: [ :each | each money ] width: 80;
		column: 'Budget' evaluated: [ :each | self moneyOn: each paymentDate ] width: 80;
		column: 'Type' evaluated: [ :each | '' ]  width: 70 tags: [ :each | { each class name removePrefix: 'FK' } ];
		column: 'Comment' evaluated: [ :each | each comment ];
		when: [ self transactions notEmpty ]
]

{ #category : #'as yet unclassified' }
BuBudget >> gtInspectorTransactionsPerMonthIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite fastTable
		title: 'Transactions per month';
		display: [ self relevantBudgetPerMonth ];
		column: 'Month' evaluated: [ :each | each key ] width: 110;
		column: 'End of month' evaluated: [ :each | self moneyOn: each key end ] width: 80;
		column: 'Transactions' evaluated: [ :each | each value transactions inject: 0 CHF into: [ :sum :x | x effectiveMoney + sum ] ] width: 120;
		column: 'Income' evaluated: [ :each | (each value transactions select: #isIncome) inject: 0 CHF into: [ :sum :x | x effectiveMoney + sum ] ] width: 80;
		column: 'Expenses' evaluated: [ :each | (each value transactions select: #isExpense) inject: 0 CHF into: [ :sum :x | x effectiveMoney + sum ] ] width: 80;
		when: [ self transactions notEmpty ];
		send: #value
]

{ #category : #api }
BuBudget >> income: aString money: aMoney on: aDate [
	self add: (FkIncome new comment: aString; money: aMoney; paymentDate: aDate)
]

{ #category : #accessing }
BuBudget >> initial: anInitial [
	initial := anInitial
]

{ #category : #initialize }
BuBudget >> initialize [
	businessItems := OrderedCollection new
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
	^ self transactions select: [ :each | each paymentDate >= self initial paymentDate ]
]

{ #category : #'as yet unclassified' }
BuBudget >> relevantTransactionsPerMonths [
	^ (self relevantTransactions asOrderedCollection groupedBy: [ :each | each paymentDate month ]) associations sorted: [ :a :b | a key < b key ]
]
