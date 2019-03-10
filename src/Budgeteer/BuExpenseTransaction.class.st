Class {
	#name : #BuExpenseTransaction,
	#superclass : #BuFinancialTransaction,
	#category : #'Budgeteer-Model'
}

{ #category : #query }
BuExpenseTransaction >> effectiveMoney [
	^ self money negative
]

{ #category : #testing }
BuExpenseTransaction >> isExpense [
	^ true
]
