Class {
	#name : #FkMonthlyPaymentExamples,
	#superclass : #Object,
	#category : #Budgeteer
}

{ #category : #'as yet unclassified' }
FkMonthlyPaymentExamples >> evaluateDuringPeriodEndingSoonerThanTheEndDate [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 1 jan, 2019 toDate: 19 feb, 2019 do: [ :v | values add: v ].
	self assert: values size = 1.
	^ monthly
]

{ #category : #'as yet unclassified' }
FkMonthlyPaymentExamples >> evaluateDuringPeriodStartingLaterThanTheStartDate [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 21 jan, 2019 toDate: 1 apr, 2019 do: [ :v | values add: v ].
	self assert: values size = 2.
	^ monthly
]

{ #category : #'as yet unclassified' }
FkMonthlyPaymentExamples >> evaluateDuringValidPeriod [
	<gtExample>
	| values monthly |
	values := OrderedCollection new.
	monthly := self monthly.
	monthly fromDate: 1 jan, 2019 toDate: 1 may, 2019 do: [ :v | values add: v ].
	self assert: values size = 3.
	^ monthly
]

{ #category : #'as yet unclassified' }
FkMonthlyPaymentExamples >> monthly [
	<gtExample>
	^ FkMonthlyPayment new monthDay: 20; startMonth: 1 jan, 2019; endMonth: 1 mar, 2019
]
