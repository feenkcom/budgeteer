Class {
	#name : #FkMonthlyPayment,
	#superclass : #FkPaymentMethod,
	#instVars : [
		'monthDay',
		'startMonth',
		'endMonth'
	],
	#category : #Budgeteer
}

{ #category : #enumerating }
FkMonthlyPayment >> endDate [
	^ Date
		year: self endMonth year
		month: self endMonth monthIndex
		day: self monthDay
]

{ #category : #accessing }
FkMonthlyPayment >> endMonth [
	^ endMonth
]

{ #category : #accessing }
FkMonthlyPayment >> endMonth: anObject [
	endMonth := anObject
]

{ #category : #enumerating }
FkMonthlyPayment >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	| start end |
	start := aStartDate max: self startDate.
	end := anEndDate min: self endDate.
	(start to: end) 
		everyMonthOn: self monthDay
		do: [ :aDate | (aDate >= start and: [ aDate <= end ]) 
			ifTrue: [ aBlock value: aDate ] ]
]

{ #category : #accessing }
FkMonthlyPayment >> monthDay [
	^ monthDay
]

{ #category : #accessing }
FkMonthlyPayment >> monthDay: anObject [
	monthDay := anObject
]

{ #category : #enumerating }
FkMonthlyPayment >> startDate [
	^ Date
		year: self startMonth year
		month: self startMonth monthIndex
		day: self monthDay
]

{ #category : #accessing }
FkMonthlyPayment >> startMonth [
	^ startMonth
]

{ #category : #accessing }
FkMonthlyPayment >> startMonth: anObject [
	startMonth := anObject
]
