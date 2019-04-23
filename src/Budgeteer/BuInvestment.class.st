Class {
	#name : #BuInvestment,
	#superclass : #BuEntry,
	#category : #'Budgeteer-Model'
}

{ #category : #initialization }
BuInvestment >> initialize [
	super initialize.
	self beExpense
]
