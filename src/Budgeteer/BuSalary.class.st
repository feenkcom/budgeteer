Class {
	#name : #BuSalary,
	#superclass : #BuBusinessItem,
	#category : #'Budgeteer-Model'
}

{ #category : #initialization }
BuSalary >> initialize [
	super initialize.
	paymentMethod := BuMonthly new monthDay: 20.
	kind := BuBusinessIncome new.
]
