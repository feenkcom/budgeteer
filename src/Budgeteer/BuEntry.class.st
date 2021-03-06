Class {
	#name : #BuEntry,
	#superclass : #Object,
	#instVars : [
		'money',
		'comment',
		'kind',
		'paymentTerm',
		'schedule'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #accessing }
BuEntry >> beExpense [
	self kind: BuExpense new
]

{ #category : #accessing }
BuEntry >> beIncome [
	self kind: BuIncome new
]

{ #category : #accessing }
BuEntry >> comment [
	^ comment
]

{ #category : #accessing }
BuEntry >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
BuEntry >> initialize [
	money := BuZeroMoney new.
	paymentTerm := 0 days.
	comment := 'Some ', (self class name gtRemovePrefix: 'Bu') asLowercase.
	self beIncome
]

{ #category : #testing }
BuEntry >> isExpense [
	^ self kind isExpense
]

{ #category : #testing }
BuEntry >> isIncome [
	^ self kind isIncome
]

{ #category : #accessing }
BuEntry >> kind [
	^ kind
]

{ #category : #accessing }
BuEntry >> kind: anObject [
	kind := anObject
]

{ #category : #accessing }
BuEntry >> money [
	^ money
]

{ #category : #accessing }
BuEntry >> money: anObject [
	money := anObject
]

{ #category : #private }
BuEntry >> newTransactionOn: aDate [
	^ (self kind newTransaction)
		money: self money;
		issueDate: aDate;
		comment: self comment;
		paymentDate: (aDate + self paymentTerm);
		businessItem: self
]

{ #category : #accessing }
BuEntry >> paymentTerm [
	^ paymentTerm
]

{ #category : #accessing }
BuEntry >> paymentTerm: aDuration [
	paymentTerm := aDuration
]

{ #category : #accessing }
BuEntry >> schedule: anObject [
	schedule := anObject
]

{ #category : #operations }
BuEntry >> transactionsFromDate: aStartDate toDate: anEndDate [
	| transactions |
	transactions := BuTransactionGroup new.
	self 
		transactionsFromDate: aStartDate 
		toDate: anEndDate 
		do: [ :aTransaction | transactions add: aTransaction ].
	^ transactions
]

{ #category : #operations }
BuEntry >> transactionsFromDate: aStartDate toDate: anEndDate do: aBlock [
	schedule
		fromDate: aStartDate
		toDate: anEndDate
		do: [ :aDate | aBlock value: (self newTransactionOn: aDate) ].
]
