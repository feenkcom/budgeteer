Class {
	#name : #FkFinancialTransaction,
	#superclass : #Object,
	#instVars : [
		'issueDate',
		'paymentDate',
		'money',
		'comment',
		'vat'
	],
	#category : #Budgeteer
}

{ #category : #accessing }
FkFinancialTransaction >> comment [
	^ comment
]

{ #category : #accessing }
FkFinancialTransaction >> comment: anObject [
	comment := anObject
]

{ #category : #query }
FkFinancialTransaction >> effectiveMoney [
	^ self subclassResponsibility
]

{ #category : #testing }
FkFinancialTransaction >> isExpense [
	^ false
]

{ #category : #testing }
FkFinancialTransaction >> isIncome [
	^ false
]

{ #category : #testing }
FkFinancialTransaction >> isInitial [
	^ false
]

{ #category : #accessing }
FkFinancialTransaction >> issueDate [
	^ issueDate
]

{ #category : #accessing }
FkFinancialTransaction >> issueDate: anObject [
	issueDate := anObject
]

{ #category : #accessing }
FkFinancialTransaction >> money [
	^ money
]

{ #category : #accessing }
FkFinancialTransaction >> money: anObject [
	money := anObject
]

{ #category : #accessing }
FkFinancialTransaction >> paymentDate [
	^ paymentDate
]

{ #category : #accessing }
FkFinancialTransaction >> paymentDate: anObject [
	paymentDate := anObject
]

{ #category : #'as yet unclassified' }
FkFinancialTransaction >> printOn: aStream [
	aStream
		nextPutAll: self effectiveMoney printString;
		nextPutAll: ' for ';
		nextPutAll: self comment;
		nextPutAll: ' on ';
		nextPutAll: self paymentDate printString
]

{ #category : #accessing }
FkFinancialTransaction >> vat [
	^ vat
]

{ #category : #accessing }
FkFinancialTransaction >> vat8 [
	self vat: 8 percent
]

{ #category : #accessing }
FkFinancialTransaction >> vat: anObject [
	vat := anObject
]
