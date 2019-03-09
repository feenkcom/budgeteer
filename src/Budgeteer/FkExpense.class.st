Class {
	#name : #FkExpense,
	#superclass : #FkFinancialTransaction,
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
