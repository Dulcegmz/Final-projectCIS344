create database banks_portal;
use banks_portal;
create table accounts (
  accountId int not null AUTO_INCREMENT,
  ownerName varchar(45) not null,
  owner_ssn int not null,
  balance decimal(10, 2) default 0.00,
  account_status varchar(45),
  primary key (accountId)
);

create table if not exists Transactions (
  transactionId int not null AUTO_INCREMENT,
  accountID int not null,
  transactionType varchar(45) not null,
  transactionAmount decimal(10, 2) not null,
  primary key (transactionId)
);


insert into accounts (ownerName, owner_ssn, balance, account_status)
values ('Maria Jozef', 123456789, 10000.00, 'active');

insert into accounts (ownerName, owner_ssn, balance, account_status)
values ('Linda Jones', 987654321, 2600.00, 'inactive');

insert into accounts (ownerName, owner_ssn, balance, account_status)
values ('John McGrail', 222222222, 100.50, 'active');

insert into accounts (ownerName, owner_ssn, balance, account_status)
values ('Patty Luna', 111111111, 509.75, 'inactive');

insert into Transactions (accountId, transactionType, transactionAmount)
values (1, "deposit", 650.98);

insert into Transactions (accountId, transactionType, transactionAmount)
values (3, "withdraw", 899.87);

insert into Transactions (accountId, transactionType, transactionAmount)
values (3, "deposit", 350.00);

delimiter //
create procedure accountTransactions (in accountId int)
begin
	select * from Transactions where accountId = accountId;
end //
delimiter ;
 
delimiter //
create procedure deposit(in accountId int, in amount decimal(10,2))
begin
	start Transaction;
insert into Transactions (accountId, transactionType, transactionAmount)
values (accountId, 'deposit', amount); 
update accounts set balance = balance + amount where accountId = accountID;
commit;
end //
delimiter ;

delimiter //
create procedure withdraw(in accountId int, in amount decimal(10,2))
begin
start Transaction;  
insert into Transactions (accountId, transactionType, transactionAmount)
values (accountId, 'withdraw', amount); 
update accounts set balance = balance - amount where accountId = accountID;
commit; 
end //
delimiter ;



