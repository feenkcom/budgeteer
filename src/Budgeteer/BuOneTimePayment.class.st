Class {
	#name : #BuOneTimePayment,
	#superclass : #BuPaymentMethod,
	#instVars : [
		'date'
	],
	#category : #Budgeteer
}

{ #category : #accessing }
BuOneTimePayment >> date [
	^ date
]

{ #category : #accessing }
BuOneTimePayment >> date: anObject [
	date := anObject
]

{ #category : #enumerating }
BuOneTimePayment >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	(aStartDate <= self date and: [ anEndDate >= self date ])
		ifTrue: [ aBlock value: self date ]
]
