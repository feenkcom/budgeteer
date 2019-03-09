Class {
	#name : #FkBusiness,
	#superclass : #Object,
	#instVars : [
		'customers',
		'agreements'
	],
	#category : #Budgeteer
}

{ #category : #accessing }
FkBusiness >> agreements [
	^ agreements
]

{ #category : #accessing }
FkBusiness >> agreements: anObject [
	agreements := anObject
]

{ #category : #accessing }
FkBusiness >> customers [
	^ customers
]

{ #category : #accessing }
FkBusiness >> customers: anObject [
	customers := anObject
]
