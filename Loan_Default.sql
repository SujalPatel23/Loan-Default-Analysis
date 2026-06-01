-- checking the data

select *
from loan_default_cleaned
limit 5;



-- checking default and non default count

select
    default_status,
    count(*) as total_applications
from loan_default_cleaned
group by default_status;



-- total applications and total defaults

select
    count(*),
    sum(default_flag)
from loan_default_cleaned;



select
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications
from loan_default_cleaned;



-- overall default rate

select
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned;



select
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned;



-- default rate by gender

select
    gender,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by gender;



-- checking loan type application count

select
    loan_type,
    count(*) as total_applications
from loan_default_cleaned
group by loan_type;



-- default rate by loan type

select
    loan_type,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by loan_type
order by default_rate desc;



-- average loan amount by default status

select
    default_status,
    round(avg(loan_amount)::numeric, 2) as avg_loan_amount
from loan_default_cleaned
group by default_status;



-- average income by default status

select 
    default_status,
    round(avg(income)::numeric, 2) as avg_income
from loan_default_cleaned
group by default_status;



-- average credit score by default status

select
    default_status,
    round(avg(credit_score)::numeric, 2) as avg_credit_score
from loan_default_cleaned
group by default_status;



-- average ltv by default status

select
    default_status,
    round(avg(ltv)::numeric, 2) as avg_ltv
from loan_default_cleaned
group by default_status;



-- average dti by default status

select
    default_status,
    round(avg(dtir1)::numeric, 2) as avg_dti
from loan_default_cleaned
group by default_status;



-- loan amount segmentation

select
    case
        when loan_amount < 100000 then 'low loan amount'
        when loan_amount between 100000 and 300000 then 'medium loan amount'
        else 'high loan amount'
    end as loan_amount_group,

    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate

from loan_default_cleaned
group by loan_amount_group
order by default_rate desc;



-- income segmentation

select
    case
        when income < 3000 then 'low income'
        when income between 3000 and 8000 then 'medium income'
        else 'high income'
    end as income_group,

    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate

from loan_default_cleaned
group by income_group
order by default_rate desc;



-- credit score segmentation

select
    case
        when credit_score < 600 then 'low credit score'
        when credit_score between 600 and 750 then 'medium credit score'
        else 'high credit score'
    end as credit_score_group,

    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate

from loan_default_cleaned
group by credit_score_group
order by default_rate desc;



-- top 5 regions with highest default rate

select 
    region,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by region
order by default_rate desc
limit 5;



-- top 5 regions with lowest default rate

select
    region,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by region
order by default_rate asc
limit 5;



-- default rate by loan purpose

select
    loan_purpose,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by loan_purpose
order by default_rate desc;



-- default rate by credit type

select
    credit_type,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by credit_type
order by default_rate desc;



-- region default rate but only where application count is more than 100

select
    region,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by region
having count(*) > 100
order by default_rate desc;



-- risk level by loan type

select
    loan_type,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate,

    case
        when round(sum(default_flag) * 100.0 / count(*), 2) >= 30 then 'high risk'
        when round(sum(default_flag) * 100.0 / count(*), 2) >= 20 then 'medium risk'
        else 'low risk'
    end as risk_level

from loan_default_cleaned
group by loan_type
order by default_rate desc;



-- creating view for main loan summary

create view loan_summary as
select
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned;



-- checking the summary view

select *
from loan_summary;



-- creating view for gender default rate

create view gender_default_rate as
select 
    gender,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by gender;



-- creating view for loan type default rate

create view loan_type_default_rate as
select
    loan_type,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by loan_type;



-- creating view for region default rate

create view region_default_rate as
select
    region,
    count(*) as total_applications,
    sum(default_flag) as defaulted_applications,
    round(sum(default_flag) * 100.0 / count(*), 2) as default_rate
from loan_default_cleaned
group by region;



-- testing the views

select *
from gender_default_rate;

select *
from loan_type_default_rate;

select *
from region_default_rate;