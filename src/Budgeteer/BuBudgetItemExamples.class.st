Class {
	#name : #BuBudgetItemExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #examples }
BuBudgetItemExamples >> asset [
	<gtExample>
	| asset transactions |
	asset := BuAsset new schedule: (BuOneTime new date: Date today); money: (BuCurrencyMoney CHF: 100).
	transactions := (asset transactionsFromDate: Date today toDate: Date today + 1 year).
	self assert: transactions size = 1.
	self assert: (transactions moneyOn: Date today) = (BuCurrencyMoney CHF: 100).
	^ asset
]

{ #category : #examples }
BuBudgetItemExamples >> salary [
	<gtExample>
	| asset transactions |
	asset := BuSalary new schedule: (BuMonthly new monthDay: 20; startMonth: 1 jan, 2019; endMonth: 1 mar, 2019); money: 100 buCHF.
	transactions := (asset transactionsFromDate: 1 jan, 2019 toDate: 1 apr, 2019).
	self assert: transactions size = 3.
	self assert: transactions totalMoney = -300 buCHF.
	self assert: (transactions moneyOn: 1 apr, 2019) = -300 buCHF.
	^ asset
]

{ #category : #examples }
BuBudgetItemExamples >> salaryWithPaymentTerm [
	<gtExample>
	| asset transactions |
	asset := BuSalary new 
		schedule: (BuMonthly new monthDay: 20; startMonth: 1 jan, 2019; endMonth: 1 mar, 2019); 
		paymentTerm: 30 days;
		money: 100 buCHF.
	transactions := (asset transactionsFromDate: 1 jan, 2019 toDate: 1 apr, 2019).
	self assert: transactions size = 3.
	self assert: transactions totalMoney = -300 buCHF.
	self assert: (transactions moneyOn: 1 apr, 2019) = -200 buCHF.
	^ asset
]
