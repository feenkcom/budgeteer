Class {
	#name : #BuPaymentMethod,
	#superclass : #Object,
	#category : #Budgeteer
}

{ #category : #enumerating }
BuPaymentMethod >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	self subclassResponsibility 
]
