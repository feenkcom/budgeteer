Class {
	#name : #FkExpense,
	#superclass : #BuFinancialTransaction,
	#category : #Budgeteer
}

{ #category : #query }
FkExpense >> effectiveMoney [
	^ self money negative
]

{ #category : #testing }
FkExpense >> isExpense [
	^ true
]
