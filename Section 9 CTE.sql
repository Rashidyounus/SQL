------CTE----- 
--Common Table Expression---


---Sales count--- by using CTE

select
 CONCAT(ss.first_name,ss.last_name) as staff,
Year (o.order_date) as year,
Sum(quantity* list_price *(1-discount)) as sales
from sales.staffs ss 

inner join sales.orders o
on o.staff_id =ss.staff_id

inner join sales.order_items ot 
on ot.order_id = o.order_id

group by 
CONCAT(ss.first_name,ss.last_name),
Year(o.order_date) ;

-- with CTE_name [(col_name)]
--AS 
-- (CTE def)
-- Sql statement

with sales_by_staff As(
select
CONCAT(ss.first_name,ss.last_name) as staff,
Year (o.order_date) as year,
Sum(quantity* list_price * (1-discount)) as sales
from sales.staffs ss 

inner join sales.orders o
on o.staff_id =ss.staff_id

inner join sales.order_items ot 
on ot.order_id = o.order_id

group by 
CONCAT(ss.first_name,ss.last_name),
Year(o.order_date) 
)

select * from sales_by_staff   where year ='2018'



-- Avg order by staff by using CTE


select * from sales.staffs
select *  from sales.orders;

with avg_order_CTE As
(
select staff_id, count (*) order_count from sales.orders 
where YEAR (order_date) =2018
group by staff_id
)

select AVG (order_count) avg_order_By_staff from avg_order_CTE;

 