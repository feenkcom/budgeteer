Class {
	#name : #BuBusinessItemExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #'as yet unclassified' }
BuBusinessItemExamples >> asset [
	<gtExample>
	| asset transactions |
	asset := BuAsset new paymentMethod: (BuOneTimePayment new date: Date today); money: (BuCurrencyMoney CHF: 100).
	transactions := (asset transactionsFromDate: Date today toDate: Date today + 1 year).
	self assert: transactions size = 1.
	self assert: (transactions moneyOn: Date today) = (BuCurrencyMoney CHF: 100).
	^ asset
]
