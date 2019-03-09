Class {
	#name : #BuEntryKind,
	#superclass : #Object,
	#category : #'Budgeteer-Model'
}

{ #category : #testing }
BuEntryKind >> isExpense [
	^ false
]

{ #category : #testing }
BuEntryKind >> isIncome [
	^ false
]

{ #category : #accessing }
BuEntryKind >> newTransaction [
	self subclassResponsibility
]
