Class {
	#name : #BuFinancialTransaction,
	#superclass : #Object,
	#instVars : [
		'issueDate',
		'paymentDate',
		'money',
		'comment',
		'agreement'
	],
	#category : #Budgeteer
}

{ #category : #accessing }
BuFinancialTransaction >> agreement: anAgreement [
	agreement := anAgreement
]

{ #category : #accessing }
BuFinancialTransaction >> comment [
	^ comment
]

{ #category : #accessing }
BuFinancialTransaction >> comment: anObject [
	comment := anObject
]

{ #category : #query }
BuFinancialTransaction >> effectiveMoney [
	^ self subclassResponsibility
]

{ #category : #testing }
BuFinancialTransaction >> isExpense [
	^ false
]

{ #category : #testing }
BuFinancialTransaction >> isIncome [
	^ false
]

{ #category : #testing }
BuFinancialTransaction >> isInitial [
	^ false
]

{ #category : #accessing }
BuFinancialTransaction >> issueDate [
	^ issueDate
]

{ #category : #accessing }
BuFinancialTransaction >> issueDate: anObject [
	issueDate := anObject
]

{ #category : #accessing }
BuFinancialTransaction >> money [
	^ money
]

{ #category : #accessing }
BuFinancialTransaction >> money: anObject [
	money := anObject
]

{ #category : #accessing }
BuFinancialTransaction >> paymentDate [
	^ paymentDate
]

{ #category : #accessing }
BuFinancialTransaction >> paymentDate: anObject [
	paymentDate := anObject
]

{ #category : #'as yet unclassified' }
BuFinancialTransaction >> printOn: aStream [
	aStream
		nextPutAll: self effectiveMoney printString;
		nextPutAll: ' for ';
		nextPutAll: self comment;
		nextPutAll: ' on ';
		nextPutAll: self paymentDate printString
]
