Class {
	#name : #BuZeroMoney,
	#superclass : #BuMoney,
	#category : #'Budgeteer-Model'
}

{ #category : #operations }
BuZeroMoney >> + aMoney [
	[  aMoney isKindOf: BuMoney ] assert.
	^ aMoney
]

{ #category : #operations }
BuZeroMoney >> = aMoney [
	^ aMoney isZero
]

{ #category : #accessing }
BuZeroMoney >> amount [
	^ 0
]

{ #category : #accessing }
BuZeroMoney >> isZero [
	^ true
]
