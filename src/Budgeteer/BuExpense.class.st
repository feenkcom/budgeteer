Class {
	#name : #BuExpense,
	#superclass : #BuEntryKind,
	#category : #'Budgeteer-Model'
}

{ #category : #testing }
BuExpense >> isExpense [
	^ true
]

{ #category : #accessing }
BuExpense >> newTransaction [
	^ BuExpenseTransaction new
]
