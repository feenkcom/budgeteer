Class {
	#name : #BuService,
	#superclass : #BuBusinessItem,
	#category : #'Budgeteer-Model'
}

{ #category : #initialization }
BuService >> initialize [
	super initialize.
	kind := BuBusinessExpense new.
]
