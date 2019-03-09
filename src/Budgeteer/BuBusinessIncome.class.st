Class {
	#name : #BuBusinessIncome,
	#superclass : #BuBusinessItemKind,
	#category : #'Budgeteer-Model'
}

{ #category : #testing }
BuBusinessIncome >> isIncome [
	^ true
]

{ #category : #accessing }
BuBusinessIncome >> newTransaction [
	^ BuIncomeTransaction new
]
