Extension { #name : #Timespan }

{ #category : #'*Budgeteer' }
Timespan >> everyMonthOn: aDayIndex do: aBlock [
	self months do: [ :each |
		aBlock value: (Date year: each year month: each month day: aDayIndex) ]
]
