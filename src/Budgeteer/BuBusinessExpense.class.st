Class {
	#name : #BuBusinessExpense,
	#superclass : #BuBusinessItemKind,
	#category : #'Budgeteer-Model'
}

{ #category : #testing }
BuBusinessExpense >> isExpense [
	^ true
]

{ #category : #accessing }
BuBusinessExpense >> newTransaction [
	^ BuExpenseTransaction new
]
