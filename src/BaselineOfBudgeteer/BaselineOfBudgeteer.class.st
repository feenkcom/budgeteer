Class {
	#name : #BaselineOfBudgeteer,
	#superclass : #BaselineOf,
	#category : #BaselineOfBudgeteer
}

{ #category : #baseline }
BaselineOfBudgeteer >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'GToolkit' with: [ spec repository: 'github://feenkcom/gtoolkit/src' ];
				package: 'Budgeteer' with: [ spec requires: #(GToolkit) ] ]
]
