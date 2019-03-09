Class {
	#name : #FkIncome,
	#superclass : #BuFinancialTransaction,
	#category : #Budgeteer
}

{ #category : #query }
FkIncome >> effectiveMoney [
	^ self money
]

{ #category : #testing }
FkIncome >> isIncome [
	^ true
]
