Class {
	#name : #BuOneTime,
	#superclass : #BuOccurence,
	#instVars : [
		'date'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #accessing }
BuOneTime >> date [
	^ date
]

{ #category : #accessing }
BuOneTime >> date: anObject [
	date := anObject
]

{ #category : #enumerating }
BuOneTime >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	(aStartDate <= self date and: [ anEndDate >= self date ])
		ifTrue: [ aBlock value: self date ]
]
