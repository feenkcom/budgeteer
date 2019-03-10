Class {
	#name : #BuMonthlyPaymentExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #examples }
BuMonthlyPaymentExamples >> evaluateDuringPeriodEndingSoonerThanTheEndDate [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 1 jan, 2019 toDate: 19 feb, 2019 do: [ :v | values add: v ].
	self assert: values size = 1.
	^ monthly
]

{ #category : #examples }
BuMonthlyPaymentExamples >> evaluateDuringPeriodStartingLaterThanTheStartDate [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 21 jan, 2019 toDate: 1 apr, 2019 do: [ :v | values add: v ].
	self assert: values size = 2.
	^ monthly
]

{ #category : #examples }
BuMonthlyPaymentExamples >> evaluateDuringValidPeriod [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 1 jan, 2019 toDate: 1 may, 2019 do: [ :v | values add: v ].
	self assert: values size = 3.
	^ monthly
]

{ #category : #examples }
BuMonthlyPaymentExamples >> monthly [
	<gtExample>
	^ BuMonthly new monthDay: 20; startMonth: (Month month: 1 year: 2019); endMonth: (Month month: 3 year: 2019)
]
