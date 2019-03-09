Class {
	#name : #BuBudgetExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #'as yet unclassified' }
BuBudgetExamples >> budget [
	<gtExample>
	| budget |
	budget := BuBudget new startDate: 1 jan, 2019; endDate: 1 apr, 2019.
	budget add: (BuSalary new 
		paymentMethod: (BuMonthly new monthDay: 20; startMonth: 1 jan, 2019; endMonth: 1 mar, 2019); 
		money: 10000 buCHF).
	budget add: (BuAsset new 
		paymentMethod: (BuOneTime new date: 1 mar, 2019);
		money: 5000 buCHF).
	self assert: budget relevantTransactions size = 4.
	^ budget

]
