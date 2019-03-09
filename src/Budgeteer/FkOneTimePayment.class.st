Class {
	#name : #FkOneTimePayment,
	#superclass : #FkPaymentMethod,
	#instVars : [
		'date'
	],
	#category : #Budgeteer
}

{ #category : #accessing }
FkOneTimePayment >> date [
	^ date
]

{ #category : #accessing }
FkOneTimePayment >> date: anObject [
	date := anObject
]

{ #category : #enumerating }
FkOneTimePayment >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	(aStartDate <= self date and: [ anEndDate >= self date ])
		ifTrue: [ aBlock value: self date ]
]
