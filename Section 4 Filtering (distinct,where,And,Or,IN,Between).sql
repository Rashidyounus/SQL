
--Distinct--
select DISTINCT state from sales.customers  ;

select distinct city, state  from sales.customers 

select distinct state , city from sales.customers 

--Using SELECT DISTINCT with multiple columns
--uses the combination of values in both city and state columns to evaluate the duplicate.
select distinct state , city from sales.customers 
order by city,state

-- Using SELECT DISTINCT with NULL


select * from sales.customers

select distinct phone from sales.customers 

select distinct phone from sales.customers 
order by phone


-- where 

select * from production.products where model_year =2018 and list_price>1000


--Between--

select * from production.products where list_price between 1000 and 2000;