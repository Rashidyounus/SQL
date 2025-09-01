
DROP TABLE IF EXISTS t1;
create table t1 (
id int identity(1,1),
a int,
b int,
primary key (id
));

INSERT INTO
    t1(a,b)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (1,2),
    (1,3),
    (2,1),
    (2,2);


select * from t1


select a,b,count(*) ascounter from t1 group by  a,b

--Using GROUP BY clause to find duplicates in a table
-- Find Duplicates 
select a,b,count(*) ascounter from t1 group by  a,b
having count(*) > 1

select * from t1

--Window function 
 --Row number
  -- 1-partitions
  -- 2-order by 

--r_no>1 duplicates
--r-no=1 unique


select id,a,b, 
Row_number() over (partition by a,b order by id desc ) as row_no
from t1; 

with dup_records as (
select id,a,b, 
Row_number() over (partition by a,b order by id desc ) as row_no
from t1 )
select * from dup_records
where row_no >1


with unique_records as (
select id,a,b, 
Row_number() over (partition by a,b order by id desc ) as row_no
from t1 )
select * from unique_records
where row_no =1

--- Delete duplicate records 
with dup_records as (
select id,a,b, 
Row_number() over (partition by a,b order by id desc ) as row_no
from t1 )

delete from t1 where id in (select id from dup_records where row_no>1)

select * from t1