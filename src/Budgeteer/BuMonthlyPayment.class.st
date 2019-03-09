Class {
	#name : #BuMonthlyPayment,
	#superclass : #BuPaymentMethod,
	#instVars : [
		'monthDay',
		'startMonth',
		'endMonth'
	],
	#category : #Budgeteer
}

{ #category : #enumerating }
BuMonthlyPayment >> endDate [
	^ Date
		year: self endMonth year
		month: self endMonth monthIndex
		day: self monthDay
]

{ #category : #accessing }
BuMonthlyPayment >> endMonth [
	^ endMonth
]

{ #category : #accessing }
BuMonthlyPayment >> endMonth: anObject [
	endMonth := anObject
]

{ #category : #enumerating }
BuMonthlyPayment >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	| start end |
	start := aStartDate max: self startDate.
	end := anEndDate min: self endDate.
	(start to: end) 
		everyMonthOn: self monthDay
		do: [ :aDate | (aDate >= start and: [ aDate <= end ]) 
			ifTrue: [ aBlock value: aDate ] ]
]

{ #category : #accessing }
BuMonthlyPayment >> monthDay [
	^ monthDay
]

{ #category : #accessing }
BuMonthlyPayment >> monthDay: anObject [
	monthDay := anObject
]

{ #category : #enumerating }
BuMonthlyPayment >> startDate [
	^ Date
		year: self startMonth year
		month: self startMonth monthIndex
		day: self monthDay
]

{ #category : #accessing }
BuMonthlyPayment >> startMonth [
	^ startMonth
]

{ #category : #accessing }
BuMonthlyPayment >> startMonth: anObject [
	startMonth := anObject
]
