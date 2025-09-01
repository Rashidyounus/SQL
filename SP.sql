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


	DECLARE @model_year SMALLINT;
	DECLARE @model_year AS SMALLINT;
			SET @model_year = 2018;


select * from production.products
where model_year=2018

DECLARE @model_year SMALLINT, 
        @product_name VARCHAR(MAX);




