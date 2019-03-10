Class {
	#name : #BuTransactionExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #examples }
BuTransactionExamples >> expenseTransactions [
	<gtExample>
	| transactions |
	transactions := self transactionsOverThreeMonths selectExpense.
	self assert: transactions size = 2.
	self assert: transactions totalMoney = self transactionsOverThreeMonths expenseMoney.
	^ transactions
]

{ #category : #examples }
BuTransactionExamples >> incomeTransactions [
	<gtExample>
	| transactions |
	transactions := self transactionsOverThreeMonths selectIncome.
	self assert: transactions size = 4.
	self assert: transactions totalMoney = self transactionsOverThreeMonths incomeMoney.
	^ transactions
]

{ #category : #examples }
BuTransactionExamples >> transactionsGroupedByMonth [
	<gtExample>
	| transactions |
	transactions := self transactionsOverThreeMonths.
	self assert: transactions perPaymentMonth size = 3.
	^ transactions
]

{ #category : #examples }
BuTransactionExamples >> transactionsOverThreeMonths [
	<gtExample>
	| transactions |
	transactions := BuTransactionGroup
		withAll:
			{(BuIncomeTransaction new
				money: 100 buCHF;
				issueDate: 1 jan , 2019;
				paymentDate: 1 feb , 2019).
			(BuIncomeTransaction new
				money: 200 buCHF;
				issueDate: 10 jan , 2019;
				paymentDate: 31 jan , 2019).
			(BuIncomeTransaction new
				money: 300 buCHF;
				issueDate: 20 jan , 2019;
				paymentDate: 30 jan , 2019).
			(BuIncomeTransaction new
				money: 400 buCHF;
				issueDate: 1 feb , 2019;
				paymentDate: 2 mar , 2019).
			(BuExpenseTransaction new
				money: 10 buCHF;
				issueDate: 1 feb , 2019;
				paymentDate: 2 mar , 2019).
			(BuExpenseTransaction new
				money: 20 buCHF;
				issueDate: 1 jan , 2019;
				paymentDate: 2 feb , 2019)}.
	self assert: transactions totalMoney = 970 buCHF.
	^ transactions
]
