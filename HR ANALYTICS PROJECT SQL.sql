select*
from hrdata

SELECT SUM(employee_count) 
FROM hrdata 
WHERE education = 'High School';

SELECT SUM(employee_count) 
FROM hrdata 
WHERE education = 'Associates Degree';
-- Regarding this kind of checking the most imp thing is to write the proper Header name.

SELECT SUM(employee_count) 
FROM hrdata 
where department = 'Sales'
-- it is also 446 in Tableau. Most Beautiful thing is to check the things by connecting SQL with Tableau.

SELECT SUM(employee_count) 
FROM hrdata 
where department = 'R&D'
-- it is also 961 in Tableau 

SELECT SUM(employee_count) 
FROM hrdata 
where education_field   = 'Medical'
-- Medical Field total is 464 as per Tableau Also.

Select count (attrition) from hrdata
where attrition = 'Yes'
-- total of attrition is 237 as per tableau


Select count (attrition) from hrdata
where attrition = 'Yes' and Education = 'Doctoral Degree'
-- Here is the number is 5 for Doc Degree

Select count (attrition) from hrdata
where attrition = 'Yes' and Department = 'R&D'
-- Total for R&D is 133

Select count (attrition) from hrdata
where attrition = 'Yes' and Department = 'R&D' and education_field = 'Medical'
-- Total Attrition for both the cases is 47


Select count (attrition) from hrdata
where attrition = 'Yes' and Department = 'R&D' and education_field = 'Medical'
and education = 'High School'
-- Total count is 9 as a output.


select round(((select count(attrition)from hrdata where attrition = 'Yes')/
sum (employee_count ))*100,2)
from hrdata 
-- The Total Calc of Attrition Rate is 16.12% as per Tableau also.

select round(((select count(attrition)from hrdata where attrition = 'Yes' and
department = 'Sales' )/
sum (employee_count ))*100,2)
from hrdata 
where department = 'Sales'
-- For Sales Department the Attrition Rate is 20.63%.

Select sum(employee_count) - ( select count (attrition)from hrdata where attrition = 'Yes')
from hrdata 
-- Total count of Active Employee 1233.


Select sum(employee_count) - ( select count (attrition)from hrdata where attrition = 'Yes'
and gender = 'Male')
from hrdata where gender = 'Male'
-- Ative Employee Male = 732

select round (avg(age),0)from hrdata
-- Avg Age count 37 yrs

--Attrition by Gender Test 
Select gender, count(attrition) from hrdata 
where attrition='Yes'
group by gender
-- Here Female 87 and Male 150

Select gender, count(attrition) from hrdata 
where attrition='Yes' and Education = 'High School'
group by gender
order by count(attrition) desc
-- Here we can see the result regarding edu department  Males r 20 and FMs r 11

-- Department wise Attrition 
Select department, count(attrition) from hrdata 
where attrition = 'Yes'
group by department 
--From Here we can get the total HR 12, Sales 92, R&D 133 full data.

Select department, count(attrition), 
round((cast (count(attrition) as numeric )
/ (Select count(attrition)from hrdata where attrition = 'Yes' ))*100)
from hrdata 
where attrition = 'Yes'
group by department 


Select department, count(attrition), 
round((cast (count(attrition) as numeric )
/ (Select count(attrition)from hrdata where attrition = 'Yes' and Gender = 'Female'))*100)
from hrdata 
where attrition = 'Yes' and Gender = 'Female'
group by department 
--Here we get the Deparment diff by Gender Female.

--No of Employee by Age Group 
select age , sum(employee_count) from hrdata 
where department = 'R&D'
group by age 
order by age 

--Education Field Wise Attrition 
select education_field , count(attrition) from hrdata 
where attrition = 'Yes'
group by education_field
order by count(attrition) desc

select education_field , count(attrition) from hrdata 
where attrition = 'Yes' and department = 'Sales'
group by education_field
order by count(attrition) desc
-- Educational Attrition for Sales Department

--Attrition by Rate For Diff Age group 
select age_band, gender,count(attrition),
round((cast(count(attrition)as numeric)
/(Select count(attrition) from hrdata where attrition = 'Yes' ))*100,2)
from hrdata 
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender

--Job Satisfaction Chart 
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab(
  'SELECT job_role, job_satisfaction, sum(employee_count)
   FROM hrdata
   GROUP BY job_role, job_satisfaction
   ORDER BY job_role, job_satisfaction'
	) AS ct(job_role varchar(50), one numeric, two numeric, three numeric, four numeric)
ORDER BY job_role;

--Here we Get the whole chart of job Satisfaction
--SQL its done bro.















