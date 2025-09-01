--- Not null Constraints
Create table sales.event (
event_id int not null,
event_name varchar (255),
start_date Date not null ,
duration dec(5,2)

);

insert into sales.event values(1,null,'08-17-2025',5.2)
alter table sales.event add primary key (event_id);
select * from sales.event

-- Unique Constraints

--unique allow one null       but  p.k not allow null values 
-- no duplicate values      



CREATE SCHEMA hr;
GO

CREATE TABLE hr.persons(
    person_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

insert into hr.persons values('rashid','Mahmood','123rashidmahmood@gmail.com')

select *from hr.persons


CREATE TABLE hr.persons1(
    person_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
);

ALTER TABLE hr.persons1
ADD email  varchar(225) ;


alter table hr.persons1 
add constraint unique_email unique (email)


select * from hr.persons1



--check Constraints 
-- filteration 
CREATE SCHEMA test;
GO

CREATE TABLE test.products(
    product_id INT IDENTITY PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unit_price DEC(10,2) CHECK(unit_price > 0)    -- add not null 
);


insert into test.products values('bike',5)
insert into test.products values('bike',-2)
select * from test.products


UPDATE test.products
SET unit_price = 1.00   -- koi valid price dal do
WHERE unit_price IS NULL;

ALTER TABLE test.products
ALTER COLUMN unit_price DEC(10,2) NOT NULL;

create schema procurement
go

CREATE TABLE procurement.vendor_groups (
    group_id INT IDENTITY PRIMARY KEY,
    group_name VARCHAR (100) NOT NULL
);

select * from procurement.vendor_groups

drop table  procurement.vendor_groups
-- one to many ---


CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT NOT NULL,
		foreign key(group_id)
		references procurement.vendor_groups(group_id)
);


insert into procurement.vendor_groups(group_name)
values('Third-party Vendors'),
     ('Interco Vendors'),
	 ('One time Vendors');
select * from procurement.vendors

insert into procurement.vendors (vendor_name,group_id)
values ('UAT',3)

select * from procurement.vendors


delete from procurement.vendor_groups 
where group_id=3

--The DELETE statement conflicted with the REFERENCE constraint "FK__vendors__group_i__540C7B00". The conflict occurred in database "BikeStores", table "procurement.vendors", column 'group_id'.

drop table procurement.vendors

-- Referential actions 
-- delete /update

--- Delete 

--- 1  No action (default)

CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT NOT NULL,
		foreign key(group_id)
		references procurement.vendor_groups(group_id)
		on delete No action  
);



delete from procurement.vendor_groups 
where group_id=3


--- 2 Cascade 


CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT NOT NULL,
		foreign key(group_id)
		references procurement.vendor_groups(group_id)
		on delete Cascade -- also delete from the child table 
);



delete from procurement.vendor_groups 
where group_id=3

--3 - ON delete Set null 
drop table procurement.vendors


CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT ,
		foreign key(group_id)
		references procurement.vendor_groups(group_id)
		on delete set null 
);


insert into procurement.vendors (vendor_name,group_id)
values ('UAT',3),
        ('ABC',1),
		('XYZ',3)

delete from procurement.vendor_groups 
where group_id=3

select * from procurement.vendors

--4 - ON delete Set default 

drop table procurement.vendor_groups 
drop table procurement.vendors
 
 
 CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT  NULL default 1,
		foreign key(group_id)
		references procurement.vendor_groups(group_id)
		on delete set default
);



insert into procurement.vendor_groups(group_name)
values('Third-party Vendors'),
     ('Interco Vendors'),
	 ('One time Vendors');
select * from procurement.vendor_groups

insert into procurement.vendors (vendor_name,group_id)
values ('UAT',3),
        ('ABC',1),
		('XYZ',3)

select * from procurement.vendors


delete from procurement.vendor_groups 
where group_id=3


