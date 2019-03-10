Class {
	#name : #BuOneTimePaymentExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #examples }
BuOneTimePaymentExamples >> evaluateDuringPeriodAfterDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date tomorrow toDate: Date tomorrow + 1 do: [ :v | value := v ].
	self assert: value isNil.
	^ oneTime
]

{ #category : #examples }
BuOneTimePaymentExamples >> evaluateDuringPeriodBeforeDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday - 1 toDate: Date yesterday do: [ :v | value := v ].
	self assert: value isNil.
	^ oneTime
]

{ #category : #examples }
BuOneTimePaymentExamples >> evaluateDuringPeriodEndingOnDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday toDate: Date today do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #examples }
BuOneTimePaymentExamples >> evaluateDuringPeriodStartingOnDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date today toDate: Date tomorrow do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #examples }
BuOneTimePaymentExamples >> evaluateDuringValidPeriod [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday toDate: Date tomorrow do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #examples }
BuOneTimePaymentExamples >> oneTime [
	<gtExample>
	^ BuOneTime new date: Date today
]
