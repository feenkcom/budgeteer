Class {
	#name : #BuIncome,
	#superclass : #BuEntryKind,
	#category : #'Budgeteer-Model'
}

{ #category : #testing }
BuIncome >> isIncome [
	^ true
]

{ #category : #accessing }
BuIncome >> newTransaction [
	^ BuIncomeTransaction new
]
