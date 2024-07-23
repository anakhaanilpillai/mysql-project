create database library;
CREATE TABLE Branch ( 
Branch_no INT PRIMARY KEY AUTO_INCREMENT, 
Manager_Id INT, 
Branch_address VARCHAR(255),
 Contact_no VARCHAR(15) 
 );
INSERT INTO Branch (Manager_Id, Branch_address, Contact_no) VALUES
(1, '123 Main St, springfield', '9234567890'),
(2, '456 kr , Shelbyville', '9345678901'),
(3, '789 drd, Capital City', '6097698760'),
 (4, '889 lms, new City', '7097698760'),
(5, '780 so, old City', '9097698760');
select*from branch;

create TABLE Employee(
Emp_Id INT PRIMARY KEY AUTO_INCREMENT,
Emp_name VARCHAR(100),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
Branch_no INT,
FOREIGN KEY (Branch_no)
REFERENCES Branch(Branch_no)
);
alter table employee change column emp_department position varchar(50);
alter table employee add column branch_no int;
alter table employee add constraint branch_no foreign key(branch_no) references branch(branch_no);

select*from employee;


CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no') DEFAULT 'yes',
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9783161484100', 'The Great Gatsby', 'Fiction', 10.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9780140177398', '1984', 'Dystopian', 15.00, 'yes', 'George Orwell', 'Penguin'),
('9780061120084', 'To Kill a Mockingbird', 'Fiction', 12.99, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('9780743273565', 'The Da Vinci Code', 'Mystery', 14.50, 'no', 'Dan Brown', 'Doubleday'),
('9780452284234', 'Pride and Prejudice', 'Romance', 9.99, 'yes', 'Jane Austen', 'Penguin Classics');
select*from books;

CREATE TABLE customer (
Coustomer_Id INT PRIMARY KEY AUTO_INCREMENT,
Customer_name VARCHAR(100),
Customer_address VARCHAR(255),
Reg_date DATE
); 
alter table customer add reg_date date ;
select * from customer;
insert into  customer (reg_date) values
('2022-01-01'),
('2021-08-02'),
('2021-08-01'),
('2002-05-09'),
('2023-11-01');

-- 5 create table issueStatus
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY AUTO_INCREMENT,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) 
    REFERENCES customer(coustomer_Id),
    FOREIGN KEY (Isbn_book) 
    REFERENCES Books(ISBN)
);
insert into Issuestatus(Issued_cust,Issued_book_name,Issue_date,Isbn_book)values
(1,'the great gatsby',current_date(),'9783161484100'),
(2,'the hobbit',current_date(),'9780140177398'),
(3,'the catcher in the rye',current_date(),'9780061120084'),
(4,'moby dick',current_date(),'9780743273565'),
(5,'1984',current_date(),'9780452284234');
select*FROM Issuestatus;



-- 6create table returnStatus

CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY AUTO_INCREMENT,
Return_cust INT,
Return_book_name VARCHAR(255),
Return_date DATE,
Isbn_book2 int,
FOREIGN KEY (Isbn_book2) 
REFERENCES Books(ISBN)
);
insert into ReturnSatus(Return_cust,Return_book_name,Return_date,Isbn_book2)values
(1,'the great gatsby',2024-07-15,'9783161484100'),
(2,'the hobbit',2024-07-16,'9780140177398'),
(3,'the catcher in the rye',2024-07-18,'9780061120084'),
(4,'moby dick',2024-07-19,'9780743273565'),
(5,'1984',2024-07-20,'9780452284234');
select*from ReturnSatus;
 -- 1 
select Book_title as title,Category,Rental_Price from Books
where Status = 'yes';


-- 2
select emp_name ,emp_salary
from employee
order by emp_salary desc;
-- 3


select b.Book_tittle,
c.Customer_name
from IssueStatus i
join books b on i.Isubn_book=
b.Isbn
join customer c on
i.Issued_cust=c.Coustomer_id;

 -- 4
 select Category, count(*)as
 total_books
 from books
 group by Category;
 -- 5
select emp_name,position
from employee
where emp_salary>50000;



select customer_name
where reg_date<'2022-01-01'
and coustomer_id not in (select
Issued_cust from Issuestatus);

select*FROM customer;
-- 7

select Branch_no ,count(emp_id)
as employee_count
from employee
group by Branch_no;


-- 8 

select distinct c.first_name
from issuestatus i
join customer c on
i.Issued_cust=c.coustomer_id
where Issue_date between '2023-06-01'
and '2023-06-30';



-- 9
select Book_title from books
where Book_title =
'1984';

-- 10
select Branch_no,count(emp_id)
as employee_count
from employee
group by Branch_no
having count(emp_id)>5;


-- 11

select e.emp_name,
b.Branch_address
from employee e
join branch b on e.Branch_no=
b.Branch_no
WHERE e.position='hr';



-- 12

select distinct C.customer_name
from IssueStatus i
join Books b on i.ISBN_book=
b.ISBN
join customer c on
i.Issued_Cust=c.Coustomer_Id
where b.Rental_Price >25;





