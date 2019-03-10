Class {
	#name : #BuIncomeTransaction,
	#superclass : #BuFinancialTransaction,
	#category : #'Budgeteer-Model'
}

{ #category : #query }
BuIncomeTransaction >> effectiveMoney [
	^ self money
]

{ #category : #accessing }
BuIncomeTransaction >> isIncome [
	^ true
]
