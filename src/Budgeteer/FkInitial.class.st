Class {
	#name : #FkInitial,
	#superclass : #FkFinancialTransaction,
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
