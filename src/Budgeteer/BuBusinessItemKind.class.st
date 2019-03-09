Class {
	#name : #BuBusinessItemKind,
	#superclass : #Object,
	#category : #'Budgeteer-Model'
}

{ #category : #testing }
BuBusinessItemKind >> isExpense [
	^ false
]

{ #category : #testing }
BuBusinessItemKind >> isIncome [
	^ false
]

{ #category : #accessing }
BuBusinessItemKind >> newTransaction [
	self subclassResponsibility
]
