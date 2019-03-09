Class {
	#name : #FkPaymentMethod,
	#superclass : #Object,
	#category : #Budgeteer
}

{ #category : #enumerating }
FkPaymentMethod >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	self subclassResponsibility 
]
