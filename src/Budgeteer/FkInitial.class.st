Class {
	#name : #FkInitial,
	#superclass : #BuFinancialTransaction,
	#category : #Budgeteer
}

{ #category : #query }
FkInitial >> effectiveMoney [
	^ self money
]

{ #category : #testing }
FkInitial >> isInitial [
	^ true
]
