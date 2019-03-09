Class {
	#name : #BuAsset,
	#superclass : #BuBusinessItem,
	#category : #'Budgeteer-Model'
}

{ #category : #initialization }
BuAsset >> initialize [
	super initialize.
	kind := BuBusinessIncome new.
]
