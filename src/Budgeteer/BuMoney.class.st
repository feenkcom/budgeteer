Class {
	#name : #BuMoney,
	#superclass : #Object,
	#category : #'Budgeteer-Model'
}

{ #category : #operations }
BuMoney >> + aMoney [
	self subclassResponsibility
]

{ #category : #operations }
BuMoney >> = aMoney [
	self subclassResponsibility
]

{ #category : #operations }
BuMoney >> amount [
	^ self subclassResponsibility
]

{ #category : #operations }
BuMoney >> isZero [
	^ self subclassResponsibility
]
