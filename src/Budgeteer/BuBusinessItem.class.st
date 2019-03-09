Class {
	#name : #BuBusinessItem,
	#superclass : #Object,
	#instVars : [
		'issueDate',
		'paymentMethod',
		'money',
		'comment'
	],
	#category : #Budgeteer
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
	money := BuCurrencyMoney CHF: 0
]

{ #category : #accessing }
BuBusinessItem >> issueDate [
	^ issueDate
]

{ #category : #accessing }
BuBusinessItem >> issueDate: anObject [
	issueDate := anObject
]

{ #category : #accessing }
BuBusinessItem >> money [
	^ money
]

{ #category : #accessing }
BuBusinessItem >> money: anObject [
	money := anObject
]

{ #category : #accessing }
BuBusinessItem >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
BuBusinessItem >> paymentMethod: anObject [
	paymentMethod := anObject
]

{ #category : #'as yet unclassified' }
BuBusinessItem >> transactionsFromDate: aStartDate toDate: anEndDate [
	| transactions |
	transactions := BuTransactionGroup new.
	self paymentMethod 
		fromDate: aStartDate 
		toDate: anEndDate 
		do: [ :aDate |
			transactions add: (BuFinancialTransaction new 
				money: self money;
				paymentDate: aDate;
				agreement: self) ].
	^ transactions
]
