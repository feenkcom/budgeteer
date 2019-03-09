Class {
	#name : #BuOccurence,
	#superclass : #Object,
	#category : #'Budgeteer-Model'
}

{ #category : #actions }
BuOccurence >> + aDuration [
	self subclassResponsibility
]

{ #category : #enumerating }
BuOccurence >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	self subclassResponsibility 
]
