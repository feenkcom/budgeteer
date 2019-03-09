Class {
	#name : #BuOneTimePaymentExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #'as yet unclassified' }
BuOneTimePaymentExamples >> evaluateDuringPeriodAfterDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date tomorrow toDate: Date tomorrow + 1 do: [ :v | value := v ].
	self assert: value isNil.
	^ oneTime
]

{ #category : #'as yet unclassified' }
BuOneTimePaymentExamples >> evaluateDuringPeriodBeforeDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday - 1 toDate: Date yesterday do: [ :v | value := v ].
	self assert: value isNil.
	^ oneTime
]

{ #category : #'as yet unclassified' }
BuOneTimePaymentExamples >> evaluateDuringPeriodEndingOnDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday toDate: Date today do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #'as yet unclassified' }
BuOneTimePaymentExamples >> evaluateDuringPeriodStartingOnDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date today toDate: Date tomorrow do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #'as yet unclassified' }
BuOneTimePaymentExamples >> evaluateDuringValidPeriod [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday toDate: Date tomorrow do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #'as yet unclassified' }
BuOneTimePaymentExamples >> oneTime [
	<gtExample>
	^ BuOneTimePayment new date: Date today
]
