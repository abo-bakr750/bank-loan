select *
 from bank_loan

select COUNT (id) as total_loan_application
  from bank_loan

select COUNT (id) as mtd_total_loan_application
  from bank_loan
   where month (issue_date) = 12 and YEAR(issue_date)= 2021

select COUNT (id) as pmtd_total_loan_application
  from bank_loan
   where month (issue_date) = 11 and YEAR(issue_date)= 2021

select SUM (loan_amount) as total_funded_amount
  from bank_loan


select SUM (loan_amount) as mtd_total_funded_amount
  from bank_loan
   where MONTH(issue_date) = 12 and YEAR(issue_date) = 12


select SUM (loan_amount) as pmtd_total_funded_amount
  from bank_loan
   where MONTH(issue_date) = 11 and YEAR(issue_date) = 12

select SUM (total_payment) as total_riecived_amount
  from bank_loan
   
select SUM (total_payment) as mtd_total_riecived_amount
  from bank_loan
   where MONTH(issue_date) =12 and YEAR(issue_date) =2021

select SUM (total_payment) as pmtd_total_riecived_amount
  from bank_loan
   where MONTH(issue_date) =11 and YEAR(issue_date) =2021

select AVG (int_rate)
  from bank_loan

select round(avg (dti),4)*100 as avg_dti_amount
  from bank_loan

select round(avg (dti),4)*100 as mtd_avg_dti_amount
  from bank_loan 
   where MONTH(issue_date) =12 and YEAR(issue_date) =2021

select round(avg (dti),4)*100 as pmtd_avg_dti_amount
  from bank_loan 
   where MONTH(issue_date) =11 and YEAR(issue_date) =2021

select 
   COUNT(case when loan_status = 'Current' OR loan_status= 'Fully Paid' then id end)*100
    / COUNT (id) as good_loan_percentage
from bank_loan

select COUNT( id )
 from bank_loan
  where  loan_status = 'Current' OR loan_status= 'Fully Paid' 

select sum( loan_amount )
 from bank_loan
  where  loan_status = 'Current' OR loan_status= 'Fully Paid' 

select sum( total_payment )
 from bank_loan
  where  loan_status = 'Current' OR loan_status= 'Fully Paid' 


select 
   COUNT(case when loan_status = 'Charged Off' then id end)*100
    / COUNT (id) as good_loan_percentage
from bank_loan

select COUNT( id )
 from bank_loan
  where  loan_status = 'Charged Off'

select sum( loan_amount )
 from bank_loan
  where  loan_status =  'Charged Off'

select sum( total_payment )
 from bank_loan
  where  loan_status = 'Charged Off'

select 
    loan_status,
	COUNT(id) as total_application,
	SUM(loan_amount) as total_funded,
	SUM(total_payment) as total_recieve,
	AVG(dti)*100 as avg_dti,
	AVG(int_rate) as avg_int_rate
from bank_loan
group by loan_status
order by total_recieve