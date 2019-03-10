Class {
	#name : #BuTransactionGroup,
	#superclass : #Object,
	#instVars : [
		'transactions'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #'instance creation' }
BuTransactionGroup class >> withAll: aCollection [
	^ self new addAll: aCollection
]

{ #category : #adding }
BuTransactionGroup >> add: aTransaction [ 
	self transactions add: aTransaction
]

{ #category : #adding }
BuTransactionGroup >> addAll: aTransaction [ 
	self transactions addAll: aTransaction
]

{ #category : #operations }
BuTransactionGroup >> expenseMoney [
	^ self selectExpense totalMoney
]

{ #category : #operations }
BuTransactionGroup >> groupedBy: aBlock [ 
	"we are reimplementing this method here and not reuse the one in collection
	because we want the keys to be groups, not simple collections"
	| result |
	result := Dictionary new.
	self transactions do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [OrderedCollection new].
		collection add: each].
	result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)].
	^result
]

{ #category : #accessing }
BuTransactionGroup >> gtTransactionsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Transactions';
		items: [ self transactions ];
		column: 'Paymeant date' do: [:aColumn | aColumn item: [:aTransaction | aTransaction paymentDate ]];
		column: 'Comment' do: [:aColumn | aColumn item: [:aTransaction | aTransaction comment ]];
		column: 'Money' do: [:aColumn | aColumn item: [:aTransaction | aTransaction effectiveMoney ]]
]

{ #category : #accessing }
BuTransactionGroup >> gtTransactionsPerPaymentMonthFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Per payment month';
		items: [ self perPaymentMonth associations ];
		column: 'Month' do: [:aColumn | aColumn item: [:assoc | assoc key ]];
		column: 'Total' do: [ :aColumn | aColumn item: [:assoc | assoc value totalMoney ]];
		column: 'Income' do: [:aColumn | aColumn item: [:assoc | assoc value incomeMoney ]];
		column: 'Expense' do: [:aColumn | aColumn item: [:assoc | assoc value expenseMoney ]]
]

{ #category : #operations }
BuTransactionGroup >> incomeMoney [
	^ self selectIncome totalMoney
]

{ #category : #initialization }
BuTransactionGroup >> initialize [
	transactions := SortedCollection sortBlock: [ :a :b | a paymentDate < b paymentDate ]
]

{ #category : #acessing }
BuTransactionGroup >> moneyOn: aDate [
	^ (self select: [ :each | each paymentDate <= aDate ])
		totalMoney
]

{ #category : #operations }
BuTransactionGroup >> perPaymentMonth [
	^ self groupedBy: [ :aTransaction | aTransaction paymentDate month ] 
]

{ #category : #operations }
BuTransactionGroup >> select: aBlock [ 
	| resultCollection result | 
	resultCollection := self transactions select: aBlock. 
	result := self species withAll: resultCollection. 
	^result
]

{ #category : #operations }
BuTransactionGroup >> selectExpense [
	^ self select: [ :aTransaction | aTransaction isExpense ]
]

{ #category : #operations }
BuTransactionGroup >> selectIncome [
	^ self select: [ :aTransaction | aTransaction isIncome ]
]

{ #category : #acessing }
BuTransactionGroup >> size [
	^ transactions size
]

{ #category : #operations }
BuTransactionGroup >> totalMoney [
	^ self transactions inject: BuZeroMoney new into: [ :sum :each | sum + each effectiveMoney ]
]

{ #category : #acessing }
BuTransactionGroup >> transactions [
	^ transactions
]
