Extension { #name : #Date }

{ #category : #'*Budgeteer' }
Date >> , aSmallInteger [
	^ self class year: aSmallInteger month: self monthIndex day: self dayOfMonth.
]
