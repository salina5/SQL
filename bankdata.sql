use team;
create table customers (
    customerid int primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    dateofbirth date not null,
    email varchar(100) unique not null,
    phonenumber varchar(15) unique not null,
    address varchar(255),
    city varchar(50),
    state varchar(50),
    zipcode varchar(10),
    country varchar(50),
    accountnumber varchar(20) unique not null,
    accounttype enum('savings', 'checking', 'business', 'loan') not null,
    balance decimal(15,2) not null default 0.00,
    interestrate decimal(5,2),
    createdat timestamp default current_timestamp,
    lasttransactiondate timestamp null,
    status enum('active', 'inactive', 'closed') default 'active',
    branchid int
);

insert into customers
(firstname, lastname, dateofbirth, email, phonenumber, address, city, state, zipcode, country, accountnumber, accounttype, balance, interestrate, branchid) 
values
('amit', 'sharma', '1985-06-15', 'amitsharma@example.com', '9876543210', '123 mg road', 'mumbai', 'maharashtra', '400001', 'india', '1000000001', 'savings', 50000.00, 2.5, 1),
('priya', 'iyer', '1992-04-22', 'priyaiyer@example.com', '9876543211', '456 brigade road', 'bengaluru', 'karnataka', '560001', 'india', '1000000002', 'checking', 75000.00, 1.8, 2),
('rahul', 'verma', '1987-12-03', 'rahulverma@example.com', '9876543212', '789 nehru street', 'delhi', 'delhi', '110001', 'india', '1000000003', 'business', 120000.00, 3.5, 3),
('neha', 'joshi', '1995-07-18', 'nehajoshi@example.com', '9876543213', '321 connaught place', 'delhi', 'delhi', '110001', 'india', '1000000004', 'savings', 45000.00, 2.2, 1),
('suresh', 'patel', '1978-05-30', 'sureshpatel@example.com', '9876543214', '654 sg highway', 'ahmedabad', 'gujarat', '380001', 'india', '1000000005', 'checking', 98000.00, 1.9, 2),
('ananya', 'reddy', '1992-08-14', 'ananyareddy@example.com', '9876543215', '987 banjara hills', 'hyderabad', 'telangana', '500034', 'india', '1000000006', 'loan', 500000.00, 5.5, 3),
('vikram', 'singh', '1988-11-25', 'vikramsingh@example.com', '9876543216', '159 mi road', 'jaipur', 'rajasthan', '302001', 'india', '1000000007', 'savings', 70000.00, 2.3, 1),
('pooja', 'desai', '2000-01-10', 'poojadesai@example.com', '9876543217', '753 fc road', 'pune', 'maharashtra', '411001', 'india', '1000000008', 'checking', 55000.00, 1.6, 2),
('arjun', 'nair', '1984-09-22', 'arjunnair@example.com', '9876543218', '852 mg road', 'chennai', 'tamil nadu', '600001', 'india', '1000000009', 'business', 200000.00, 4.0, 3),
('meera', 'kapoor', '1993-06-05', 'meerakapoor@example.com', '9876543219', '258 bandra west', 'mumbai', 'maharashtra', '400050', 'india', '1000000010', 'savings', 60000.00, 2.4, 1),
('rohan', 'gupta', '1981-10-11', 'rohangupta@example.com', '9876543220', '159 gomti nagar', 'lucknow', 'uttar pradesh', '226010', 'india', '1000000011', 'checking', 65000.00, 1.7, 2),
('sneha', 'chowdhury', '1996-03-14', 'snehachowdhury@example.com', '9876543221', '369 park street', 'kolkata', 'west bengal', '700016', 'india', '1000000012', 'loan', 300000.00, 5.2, 3),
('manoj', 'mishra', '1975-07-29', 'manojmishra@example.com', '9876543222', '852 civil lines', 'kanpur', 'uttar pradesh', '208001', 'india', '1000000013', 'savings', 82000.00, 2.6, 1),
('kavita', 'bose', '1998-12-19', 'kavitabose@example.com', '9876543223', '753 sector 18', 'noida', 'uttar pradesh', '201301', 'india', '1000000014', 'checking', 47000.00, 1.8, 2),
('harish', 'rao', '1980-09-01', 'harishrao@example.com', '9876543224', '654 jubilee hills', 'hyderabad', 'telangana', '500033', 'india', '1000000015', 'business', 250000.00, 3.8, 3),
('swati', 'menon', '1994-02-21', 'swatimenon@example.com', '9876543225', '321 mg road', 'bengaluru', 'karnataka', '560001', 'india', '1000000016', 'savings', 58000.00, 2.1, 1),
('nitin', 'malhotra', '1983-11-07', 'nitinmalhotra@example.com', '9876543226', '147 rajouri garden', 'delhi', 'delhi', '110027', 'india', '1000000017', 'checking', 73000.00, 1.9, 2),
('deepika', 'shukla', '1997-05-26', 'deepikashukla@example.com', '9876543227', '963 ashok nagar', 'bhopal', 'madhya pradesh', '462001', 'india', '1000000018', 'loan', 450000.00, 5.3, 3),
('karan', 'yadav', '1991-01-16', 'karanyadav@example.com', '9876543228', '357 subhash marg', 'indore', 'madhya pradesh', '452001', 'india', '1000000019', 'savings', 62000.00, 2.3, 1),
('ritika', 'garg', '1999-08-12', 'ritikagarg@example.com', '9876543229', '258 ajmeri gate', 'jaipur', 'rajasthan', '302003', 'india', '1000000020', 'checking', 56000.00, 1.7, 2);

select * from customers;

-- 1. **Retrieve the first name, last name, city, and state of all customers from Mumbai.
select firstname, lastname, city, state from customers
where city='mumbai';

-- 2. **List the first name, last name, account type, and balance of all savings account holders with a balance greater than ₹60,000.**  
select firstname, lastname, accounttype, balance from customers
where accounttype ='savings' and balance > 60000;

-- 3. **Calculate the total balance of all checking account holders.**  
select sum(balance) as SUM from customers
where accounttype = 'checking';

-- 4. **Display the first name, last name, and email of customers whose email contains 'example.com'.** 
select firstname, lastname, email from	customers
where email like '%example.com%';

-- 5. **Find the first name, last name, and balance of the customer with the highest balance.**  
select firstname, lastname, balance from customers
where (select max(balance) from customers);

select firstname, lastname, balance from customers
order by balance desc limit 1;

-- 6. **List the first name, last name, and date of birth of all customers born before 1990.**  
select firstname, lastname, balance, dateofbirth from customers
where dateofbirth > 1990;

-- 7. **Count how many accounts each branch has.**  
select branchid, count(*) as totalaccounts
from customers group by branchid;

-- 8. **Retrieve the first name, last name, and interest rate of customers with an interest rate greater than 3%.**  
select firstname, lastname, interestrate from customers
where interestrate > 3.0;

-- 9. **List the first name, last name, and address of customers whose address contains the word 'road'.**  
select firstname, lastname, address from customers
where address like  "%road%";

-- 10. **Display the first name, last name, and balance of all customers sorted by balance in descending order.**
select firstname, lastname, balance from customers
order by balance desc;


