--1) Basic SQL Server SELECT statement example

select * from production.brands

select first_name,last_name from sales.customers
select product_id,product_name,list_price from production.products

----- Using the SQL Server SELECT to retrieve all columns of a table--

select * from sales.customers

--Filtering rows using the WHERE clause--
select * from sales.customers where state='CA'
select * from sales.customers where state='NY'

select * from sales.customers where city='Fairport'
select * from sales.customers where state ='CA' or state='NY'

-- Sorting rows using the ORDER BY clause--

select * from sales.customers where state='NY'
order by first_name desc    -- Asc

--  Sort a result set by one column in ascending order
select * from production.products order by list_price

--Sort a result set by one column in descending order
select * from production.products order by list_price desc

--Sort a result set by multiple columns in different orders
select * from production.products order by model_year ,list_price desc
select first_name,last_name,city,state from sales.customers order by state


--Sort a result set by a column that is not in the select list
select first_name,last_name,city from sales.customers order by state



select first_name,last_name,city from sales.customers
order by 1,2

select first_name,last_name,city from sales.customers
order by 3

--- Limiting Rows---
--Top always use oeder by clause

select Top 10 *  from production.products order by  list_price desc ;
select top 100 * from  production.stocks order by quantity asc;


-- OFF SET
select* from sales.orders
order by order_id
offset 10 rows

select* from sales.orders
order by order_id
offset 100 rows

-- Fetch 
select* from sales.orders
order by order_id
offset 10 rows
fetch next 10 rows only
