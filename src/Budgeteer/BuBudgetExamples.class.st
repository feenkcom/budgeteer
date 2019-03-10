Class {
	#name : #BuBudgetExamples,
	#superclass : #Object,
	#category : #'Budgeteer-Examples'
}

{ #category : #examples }
BuBudgetExamples >> budget [
	<gtExample>
	| budget |
	budget := BuBudget new startDate: 1 jan, 2019; endDate: 1 apr, 2019.
	budget add: (BuSalary new 
		schedule: (BuMonthly new monthDay: 20; startMonth: (Month month: 1 year: 2019); endMonth: (Month month: 4 year: 2019)); 
		paymentTerm: 20;
		money: 10000 buCHF).
	budget add: (BuAsset new 
		schedule: (BuOneTime new date: 1 mar, 2019);
		money: 5000 buCHF).
	self assert: budget relevantTransactions size = 4.
	^ budget

]

{ #category : #examples }
BuBudgetExamples >> budgetWithOneSalary [
	<gtExample>
	| budget transactions |
	budget := BuBudget new startDate: 1 jan, 2019; endDate: 20 feb, 2019.
	budget add: (BuSalary new 
		schedule: (BuMonthly new monthDay: 20; startMonth: (Month month: 2 year: 2019); endMonth: (Month month: 2 year: 2019)); 
		paymentTerm: 1 day;
		money: 10000 buCHF).
	transactions := budget relevantTransactions.
	self assert: transactions size = 1.
	self assert: transactions first paymentDate = (21 feb, 2019).
	^ budget

]
