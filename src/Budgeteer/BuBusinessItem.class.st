Class {
	#name : #BuBusinessItem,
	#superclass : #Object,
	#instVars : [
		'paymentMethod',
		'money',
		'comment',
		'kind',
		'paymentTerm'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #accessing }
BuBusinessItem >> comment [
	^ comment
]

{ #category : #accessing }
BuBusinessItem >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
BuBusinessItem >> initialize [
	money := BuZeroMoney new.
	paymentTerm := 0 days
]

{ #category : #testing }
BuBusinessItem >> isExpense [
	^ self kind isExpense
]

{ #category : #testing }
BuBusinessItem >> isIncome [
	^ self kind isIncome
]

{ #category : #accessing }
BuBusinessItem >> kind [
	^ kind
]

{ #category : #accessing }
BuBusinessItem >> kind: anObject [
	kind := anObject
]

{ #category : #accessing }
BuBusinessItem >> money [
	^ money
]

{ #category : #accessing }
BuBusinessItem >> money: anObject [
	money := anObject
]

{ #category : #operations }
BuBusinessItem >> newTransactionOn: aDate [
	^ (self kind newTransaction)
		money: self money;
		issueDate: aDate;
		paymentDate: (aDate + self paymentTerm);
		businessItem: self
]

{ #category : #accessing }
BuBusinessItem >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
BuBusinessItem >> paymentMethod: anObject [
	paymentMethod := anObject
]

{ #category : #accessing }
BuBusinessItem >> paymentTerm [
	^ paymentTerm
]

{ #category : #accessing }
BuBusinessItem >> paymentTerm: anObject [
	paymentTerm := anObject
]

{ #category : #operations }
BuBusinessItem >> transactionsFromDate: aStartDate toDate: anEndDate [
	| transactions |
	transactions := BuTransactionGroup new.
	self paymentMethod
		fromDate: aStartDate
		toDate: anEndDate
		do: [ :aDate | transactions add: (self newTransactionOn: aDate) ].
	^ transactions
]
