Extension { #name : #SmallInteger }

{ #category : #'*Budgeteer' }
SmallInteger >> apr [
	^ Date year: Date today year month: 4 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> aug [
	^ Date year: Date today year month: 8 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> dec [
	^ Date year: Date today year month: 12 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> feb [
	^ Date year: Date today year month: 2 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> jan [
	^ Date year: Date today year month: 1 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> jul [
	^ Date year: Date today year month: 7 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> jun [
	^ Date year: Date today year month: 6 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> mar [
	^ Date year: Date today year month: 3 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> may [
	^ Date year: Date today year month: 5 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> nov [
	^ Date year: Date today year month: 11 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> oct [
	^ Date year: Date today year month: 10 day: self.
]

{ #category : #'*Budgeteer' }
SmallInteger >> sep [
	^ Date year: Date today year month: 9 day: self.
]
