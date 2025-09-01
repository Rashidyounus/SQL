----CASE 

---CASE Expression ----


--CASE input   
--    WHEN e1 THEN r1
--    WHEN e2 THEN r2
--    ...
--    WHEN en THEN rn
--    [ ELSE re ]   
--END  


select * from sales.orders

select  order_status, COUNT(order_id) order_count from sales.orders 
GROUP BY 
order_status;






SELECT    
    CASE order_status
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
    END AS order_status, 
    COUNT(order_id) order_count
FROM    
    sales.orders
GROUP BY 
    order_status;







select
     ot.order_id,
     sum(ot.list_price * ot.quantity) as order_value,
     case 
         when sum(ot.list_price * ot.quantity) < 2500 then 'low'
	     when sum(ot.list_price * ot.quantity) > 2500 AND sum(ot.list_price * ot.quantity) <= 5000 then 'medium'
	     when sum(ot.list_price * ot.quantity) > 5000 AND sum(ot.list_price * ot.quantity) <= 15000 then 'high'
     else null
     ENd as order_priority 
     from sales.order_items  ot
group by 
    ot.order_id;



	with cte_orders as (select
     ot.order_id,
     sum(ot.list_price * ot.quantity) as order_value,
     case 
         when sum(ot.list_price * ot.quantity) < 2500 then 'low'
	     when sum(ot.list_price * ot.quantity) > 2500 AND sum(ot.list_price * ot.quantity) <= 5000 then 'medium'
	     when sum(ot.list_price * ot.quantity) > 5000 AND sum(ot.list_price * ot.quantity) <= 15000 then 'high'
     else null
     ENd as order_priority 
     from sales.order_items  ot
group by 
    ot.order_id)
	select * from cte_orders where order_priority ='high'


	-- COALESCE---
	select Coalesce (10,null,null,3) as result;
	select Coalesce (null,3,null,3) as result;



select * from sales.customers
select first_name,last_name,phone from sales.customers

select first_name,last_name,
	case
	    when phone is not null then phone 
	    else 'N/A'
		end as phone,
    email
	from sales.customers

select first_name,last_name,
	Coalesce (phone,'N/A') as phone ,
    email
	from sales.customers


Create Table sales.salaries(
staff_id int primary key,
hourly_rate decimal,
weekly_rate decimal,
monthly_rate decimal,
check(
hourly_rate is not null or
weekly_rate is not null or
monthly_rate is not null ));

insert into sales.salaries (staff_id,hourly_rate,weekly_rate,monthly_rate) 
values
(1,20,null,null),
(2,30,null,null),
(3,null,1000,null),
(4,null,null,6000),
(5,null,null,65000);

select * from sales.salaries
--- use coalesce and find monthly salary ---
select staff_id ,coalesce(
hourly_rate * 22* 8,
weekly_rate *4,
monthly_rate
) monthly_salary from sales.salaries