CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        production.products
    ORDER BY 
        product_name;
END;

execute uspProductList



 ALTER PROCEDURE uspProductList
    AS
    BEGIN
        SELECT 
            product_name, 
            list_price
        FROM 
            production.products
        ORDER BY 
            list_price 
    END;





CREATE PROCEDURE uspFindProducts
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    ORDER BY
        list_price;
END;


execute uspFindProducts
----Creating a stored procedure with one parameter
ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price
    ORDER BY
        list_price;
END;
execute uspFindProducts
@min_list_price =1000

----Creating a stored procedure with multiple parameters----

ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL,@max_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price  and list_price <  @max_list_price
    ORDER BY
        list_price;
END;


execute uspFindProducts
@min_list_price =1000,
@max_list_price=3000


----Creating optional parameters

ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL = 0
    ,@max_list_price AS DECIMAL = 999999
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;


EXECUTE uspFindProducts 
    @name = 'Trek';


DECLARE @model_year AS SMALLINT;
SET @model_year = 2018;


select * from production.products
where model_year=2018

Declare @product_count int
set @product_count = (select count (*) from production.products);
--select @product_count
print @product_count


alter procedure useGetProductList (@model_year int)
as 
begin
Declare @product_list varchar(max)
set @product_list =''
select @product_list = @product_list+product_name + char(10)
from production.products
where model_year=@model_year
print (@product_list)
End;


execute useGetProductList 2018



select @@ROWCOUNT

Begin 
    select product_name  from
	production.products where list_price >100

	if @@ROWCOUNT =0 
	    print 'No product found';
END;



--- Nested Begin End


BEGIN
    DECLARE @name VARCHAR(MAX);

    SELECT TOP 1
        @name = product_name
    FROM
        production.products
    ORDER BY
        list_price DESC;
    
    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The most expensive product is ' + @name
    END
    ELSE
    BEGIN
        PRINT 'No product found';
    END;
END


--- IF ELSE

-- While
-- print only 5
Declare @count int
set @count =0
while @count <5
    set @count =@count +1
    print @count


	---1,2,3,4,5
Declare @count int
set @count =0

while @count <5
begin

    set @count =@count +1
    print @count
End