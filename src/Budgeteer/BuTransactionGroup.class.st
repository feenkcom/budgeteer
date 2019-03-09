Class {
	#name : #BuTransactionGroup,
	#superclass : #Object,
	#instVars : [
		'transactions'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #adding }
BuTransactionGroup >> add: aTransaction [ 
	self transactions add: aTransaction
]

{ #category : #adding }
BuTransactionGroup >> addAll: aTransaction [ 
	self transactions addAll: aTransaction
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

{ #category : #acessing }
BuTransactionGroup >> select: aBlock [
	^ self class new addAll: (self transactions select: aBlock)
]

{ #category : #acessing }
BuTransactionGroup >> size [
	^ transactions size
]

{ #category : #acessing }
BuTransactionGroup >> totalMoney [
	^ self transactions inject: BuZeroMoney new into: [ :sum :each | sum + each money ]
]

{ #category : #acessing }
BuTransactionGroup >> transactions [
	^ transactions
]
