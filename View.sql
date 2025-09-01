



-- CTE 
with dup_records as (
select id,a,b,ROW_NUMBER() over (partition by a,b order by id desc) as row_no from t1)
select * from dup_records;

select * from t1


---- VIew-----
-- View   only saving query 

Create view sales.dummy_view as select * from t1
where id>5


drop view sales.by_product_name_view
select * from sales.dummy_view


CREATE VIEW sales.by_staff_view
AS
SELECT  
    s.first_name + ' ' + s.last_name AS staff,
    SUM(i.quantity * i.list_price * (1 - i.discount)) AS sales,
    YEAR(o.order_date) AS year
FROM sales.orders o
INNER JOIN sales.order_items i 
    ON i.order_id = o.order_id
INNER JOIN sales.staffs s 
    ON s.staff_id = o.staff_id
GROUP BY  
    s.first_name + ' ' + s.last_name,
    YEAR(o.order_date);


select * from sales.by_staff_view


Create or alter  View sales.daily_sales AS 
SELECT  
    YEAR(o.order_date) AS y,
	month (o.order_date) As m,
	day (o.order_date) as d,
	p.product_id,p.product_name,
	quantity * i.list_price AS sales

FROM sales.orders o
INNER JOIN sales.order_items i 
    ON i.order_id = o.order_id
INNER JOIN production.products AS p
    ON p.product_id = i.product_id;


select * from sales.daily_sales 


select y,sum(sales) from   sales.daily_sales 
group by y
	



