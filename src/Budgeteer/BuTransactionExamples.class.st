Class {
	#name : #BuTransactionExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #'as yet unclassified' }
BuTransactionExamples >> transactionsGroupedByMonth [
	<gtExample>
	| transactions |
	transactions := BuTransactionGroup withAll: { 
		BuIncomeTransaction new 	
			money: 100 buCHF;
			issueDate: 1 jan, 2019;
			paymentDate: 1 feb, 2019 .
		BuIncomeTransaction new 	
			money: 200 buCHF;
			issueDate: 10 jan, 2019;
			paymentDate: 31 jan, 2019 .
		BuIncomeTransaction new 	
			money: 300 buCHF;
			issueDate: 20 jan, 2019;
			paymentDate: 30 jan, 2019 .
		BuIncomeTransaction new 	
			money: 400 buCHF;
			issueDate: 1 feb, 2019;
			paymentDate: 2 mar, 2019 .
		BuExpenseTransaction new 	
			money: 10 buCHF;
			issueDate: 1 feb, 2019;
			paymentDate: 2 mar, 2019 .
		BuExpenseTransaction new 	
			money: 20 buCHF;
			issueDate: 1 jan, 2019;
			paymentDate: 2 feb, 2019 .
	}.
	self assert: transactions perPaymentMonth size = 3.
	^ transactions
]
