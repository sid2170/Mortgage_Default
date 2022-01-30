# Mortgage_Default
The goal is to predict which of future such approved mortgages will default. The purpose
of this prediction is not to alter the underwriting standards, but rather to assess the need for and cost
of secondary insurance on mortgages. The data is described by the following attributes.

Description of Attributes
Bo Age Borrower age
Ln Orig Value of loan, USD
Orig LTV Ratio Pct Ratio of loan to home purchase price
Credit score Borrower’s credit score
First home First time home buyer? (Y/N)
Tot mthly debt exp Borrower’s total monthly debt expense
Tot mthly incm Borrower’s total monthly income
orig apprd val amt Appraised value of home at origination
pur prc amt Purchase price for house
DTI ratio Borrower debt to income ratio (Tot mthly debt exp/Tot mthly incm)
Status Current loan status
OUTCOME Binary version of “Status” (either default or non-default)
State US state in which home is located
UPB>Appraisal Loan amount (Ln Orig) greater than appraisal (orig apprd val amt) 0-no, 1=yes
