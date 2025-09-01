CREATE TABLE production.parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);


INSERT INTO 
    production.parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');


select * from  production.parts


SELECT  part_id,part_name FROM production.parts WHERE part_id = 5;


	--cluster index  key value 
	-- non-cluster   

	--primary key k base pe banega--
	--When you create a table with a primary key, SQL Server automatically creates 
	--a corresponding clustered index that includes primary key columns.

	alter table  production.parts 
	add primary key(part_id);
	drop table  production.parts 
	----Create Clusterindex---------------

create clustered index index_by_parts_id on production.parts(part_id);



	---Non Cluster index------
SELECT  customer_id, city FROM  sales.customers WHERE city = 'Atwater';


CREATE INDEX ix_customers_city
ON sales.customers(city); 


select customer_id, first_name,last_name from sales.customers



Create index Ix_name 
on sales.customers(first_name,last_name);

select customer_id, first_name,last_name from sales.customers
where first_name ='Monika' ANd last_name ='Berg'


---Clustered
select customer_id, first_name,last_name from sales.customers
where 
customer_id =46 and 
first_name ='Monika' ANd last_name ='Berg'


--- non-clustered
select customer_id, first_name,last_name from sales.customers
where 
customer_id =46 or 
first_name ='Monika' ANd last_name ='Berg'
 


select  first_name,last_name,city from 
sales.customers
where 
first_name ='Monika' ANd last_name ='Berg'


--- Disable Index 

alter index Ix_name  on sales.customers 
disable

alter index Ix_name  on sales.customers 
rebuild



-- unique index

SELECT customer_id, email 
FROM sales.customers
WHERE email = 'caren.stephens@msn.com';


CREATE UNIQUE INDEX ix_cust_email 
ON sales.customers(email);



DROP INDEX  ix_cust_email
ON sales.customers;


select first_name,last_name,email from sales.customers
where email ='caren.stephens@msn.com';


CREATE UNIQUE INDEX ix_cust_email_inc
ON sales.customers(email)
INCLUDE(first_name,last_name);




SELECT 
    SUM(CASE
            WHEN phone IS NULL
            THEN 1
            ELSE 0
        END) AS [Has Phone], 
    SUM(CASE
            WHEN phone IS NULL
            THEN 0
            ELSE 1
        END) AS [No Phone]
FROM 
    sales.customers;


