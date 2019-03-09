Class {
	#name : #FkOneTimePaymentExamples,
	#superclass : #Object,
	#category : #Budgeteer
}

{ #category : #'as yet unclassified' }
FkOneTimePaymentExamples >> evaluateDuringPeriodAfterDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date tomorrow toDate: Date tomorrow + 1 do: [ :v | value := v ].
	self assert: value isNil.
	^ oneTime
]

{ #category : #'as yet unclassified' }
FkOneTimePaymentExamples >> evaluateDuringPeriodBeforeDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday - 1 toDate: Date yesterday do: [ :v | value := v ].
	self assert: value isNil.
	^ oneTime
]

{ #category : #'as yet unclassified' }
FkOneTimePaymentExamples >> evaluateDuringPeriodEndingOnDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday toDate: Date today do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #'as yet unclassified' }
FkOneTimePaymentExamples >> evaluateDuringPeriodStartingOnDate [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date today toDate: Date tomorrow do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #'as yet unclassified' }
FkOneTimePaymentExamples >> evaluateDuringValidPeriod [
	<gtExample>
	| value oneTime |
	value := nil.
	oneTime := self oneTime.
	oneTime fromDate: Date yesterday toDate: Date tomorrow do: [ :v | value := v ].
	self assert: value = Date today.
	^ oneTime
]

{ #category : #'as yet unclassified' }
FkOneTimePaymentExamples >> oneTime [
	<gtExample>
	^ FkOneTimePayment new date: Date today
]
