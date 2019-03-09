Class {
	#name : #BuSalary,
	#superclass : #BuBusinessItem,
	#category : #Budgeteer
}

{ #category : #initialization }
BuSalary >> initialize [
	paymentMethod := BuMonthlyPayment new monthDay: 20
]
