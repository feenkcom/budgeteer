Class {
	#name : #FkBusinessAgreement,
	#superclass : #Object,
	#instVars : [
		'issueDate',
		'paymentMethod',
		'money',
		'comment'
	],
	#category : #Budgeteer
}

{ #category : #accessing }
FkBusinessAgreement >> comment [
	^ comment
]

{ #category : #accessing }
FkBusinessAgreement >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
FkBusinessAgreement >> initialize [
	money := 0 CHF
]

{ #category : #accessing }
FkBusinessAgreement >> issueDate [
	^ issueDate
]

{ #category : #accessing }
FkBusinessAgreement >> issueDate: anObject [
	issueDate := anObject
]

{ #category : #accessing }
FkBusinessAgreement >> money [
	^ money
]

{ #category : #accessing }
FkBusinessAgreement >> money: anObject [
	money := anObject
]
