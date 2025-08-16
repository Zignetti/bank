-- objectives 
-- to create a bank account database that will hold accounts,
-- customers and balances tables with restrictions

-- create accounts table

create table accounts (
    accountID int auto_increment primary key,
    customersID int not null,
    balancesID int not null,
-- account number cannot be empty and must be 10 character length
    account_number char(10) not null,
    kyc_status varchar(10) not null,
    open_date date not null,
-- account number must be numeric and date account open should be within the period
    check (account_number regexp '^[0-9]{10}$'),
    check (year (open_date)=2029 ),
    
-- create foreign keys to the other two tables
	foreign key (customersID) references customers(customerID),
    foreign key (balancesID) references balances(balanceID)
);



-- insert data into the table
insert into accounts (customersID, balancesID, account_number, kyc_status, open_date)
values (1, 1, '0000000001', 'Verified', '2029-03-21'),
		(2, 2, '0000000002', 'Unverified', '2029-05-20');

-- create the customers table
create table customers(
customerID int auto_increment primary key,
customerName varchar(100) not null,
address varchar(100) not null,
phone varchar(50) ,
email varchar(50),
accountNumber char(10) not null,
accountType varchar(50) not null,
dateOpen date not null);

insert into customers(customerName,address,phone,email,accountNumber,accountType,dateOpen)
values('Nice Show','14,Mysql Drive','+123456789','nice.show@sql.com','0000000001','savings','2029-08-16'),
	  ('Fair Review','80,Mysql Avenue','0123456789','fair.review@sql.net','0000000002','current','2029-09-24');


-- create the balance table

create table balances (
balanceID int auto_increment primary key,
accountNumber char(10) not null,
balances decimal(15,2) not null,
balanceStatus enum('cr','dr') not null,
lastUpdate date not null
);


insert into balances(accountNumber,balances,balanceStatus,lastUpdate)
values('0000000001',1000.20,'cr','2029-01-30'),
('0000000002',40.90,'dr','2029-01-30');

--- conclusion---
-- created each of the tables with their respective constrains
-- and then add foreign keys to the account table to ensure every account record has
-- a corresponding record in the other two tables

