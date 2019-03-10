Class {
	#name : #BuMonthly,
	#superclass : #BuOccurence,
	#instVars : [
		'monthDay',
		'startMonth',
		'endMonth'
	],
	#category : #'Budgeteer-Model'
}

{ #category : #enumerating }
BuMonthly >> endDate [
	^ Date
		year: self endMonth year
		month: self endMonth monthIndex
		day: self monthDay
]

{ #category : #accessing }
BuMonthly >> endMonth [
	^ endMonth
]

{ #category : #accessing }
BuMonthly >> endMonth: aMonth [
	endMonth := aMonth
]

{ #category : #enumerating }
BuMonthly >> fromDate: aStartDate toDate: anEndDate do: aBlock [
	| start end |
	start := aStartDate max: self startDate.
	end := anEndDate min: self endDate.
	(start to: end) 
		everyMonthOn: self monthDay
		do: [ :aDate | (aDate >= start and: [ aDate <= end ]) 
			ifTrue: [ aBlock value: aDate ] ]
]

{ #category : #accessing }
BuMonthly >> monthDay [
	^ monthDay
]

{ #category : #accessing }
BuMonthly >> monthDay: anObject [
	monthDay := anObject
]

{ #category : #enumerating }
BuMonthly >> startDate [
	^ Date
		year: self startMonth year
		month: self startMonth monthIndex
		day: self monthDay
]

{ #category : #accessing }
BuMonthly >> startMonth [
	^ startMonth
]

{ #category : #accessing }
BuMonthly >> startMonth: aMonth [
	startMonth := aMonth
]
