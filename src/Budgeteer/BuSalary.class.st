Class {
	#name : #BuSalary,
	#superclass : #BuEntry,
	#category : #'Budgeteer-Model'
}

{ #category : #initialization }
BuSalary >> initialize [
	super initialize.
	schedule := BuMonthly new monthDay: 20.
	self beExpense
]
