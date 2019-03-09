Class {
	#name : #BuMonthlyPaymentExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #'as yet unclassified' }
BuMonthlyPaymentExamples >> evaluateDuringPeriodEndingSoonerThanTheEndDate [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 1 jan, 2019 toDate: 19 feb, 2019 do: [ :v | values add: v ].
	self assert: values size = 1.
	^ monthly
]

{ #category : #'as yet unclassified' }
BuMonthlyPaymentExamples >> evaluateDuringPeriodStartingLaterThanTheStartDate [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 21 jan, 2019 toDate: 1 apr, 2019 do: [ :v | values add: v ].
	self assert: values size = 2.
	^ monthly
]

{ #category : #'as yet unclassified' }
BuMonthlyPaymentExamples >> evaluateDuringValidPeriod [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 1 jan, 2019 toDate: 1 may, 2019 do: [ :v | values add: v ].
	self assert: values size = 3.
	^ monthly
]

{ #category : #'as yet unclassified' }
BuMonthlyPaymentExamples >> monthly [
	<gtExample>
	^ BuMonthly new monthDay: 20; startMonth: 1 jan, 2019; endMonth: 1 mar, 2019
]
