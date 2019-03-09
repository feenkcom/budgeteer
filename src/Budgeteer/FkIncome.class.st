Class {
	#name : #FkIncome,
	#superclass : #FkFinancialTransaction,
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
