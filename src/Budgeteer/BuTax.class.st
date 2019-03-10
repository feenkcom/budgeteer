Class {
	#name : #BuTax,
	#superclass : #BuEntry,
	#category : #'Budgeteer-Model'
}

{ #category : #initialization }
BuTax >> initialize [
	super initialize.
	schedule := BuMonthly new monthDay: 20.
	self beExpense
]
