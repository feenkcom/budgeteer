Extension { #name : #Number }

{ #category : #'*Budgeteer' }
Number >> buCHF [
	^ BuCurrencyMoney CHF: self
]
