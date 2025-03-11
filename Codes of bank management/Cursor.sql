-- Cursor 

select * from employees;

-- steps of cursor step by step
-- Dcelare cursor_name cursor for select_statment;
-- open cname;
-- [Welcome:]
-- loop statement_list end loop [Welcome]
-- fetch cursor name into variable list;
-- close cursor name;

delimiter $$
create procedure processEmployeeFullname()
begin
Declare done int default 0;
declare v_firstname varchar (50);
declare v_lastname varchar (50);
declare v_fullname varchar (100);
declare emp_cursor cursor for 
select firstname,lastname from employee;
declare continue handler for not found set done =1;
open emp_cursor;
read_loop: loop
fetch emp_cursor into v_firstname,v_lastname;
if done then 
leave read_loop;
End if;
set v_fullname = concat(v_firstname,' ',v_lastname);
select v_fullname as Fullname;
end loop;
close emp_cursor;
End $$
delimiter ;
call processEmployeeFullname();
select * from employees;
drop procedure processEmployeeFullname;


CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary FLOAT
);

INSERT INTO employee (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '9876543210', '2023-01-10', 101, 60000),
(2, 'Alice', 'Smith', 'alice.smith@example.com', '9876543211', '2022-05-15', 102, 75000),
(3, 'Bob', 'Brown', 'bob.brown@example.com', '9876543212', '2021-08-20', 103, 80000),
(4, 'David', 'Miller', 'david.miller@example.com', '9876543213', '2020-11-25', 104, 65000),
(5, 'Emma', 'Davis', 'emma.davis@example.com', '9876543214', '2019-09-05', 105, 72000);

delimiter $$
create procedure new1()
begin
Declare done int default 0;
declare e_first_name varchar (50);
declare e_last_name varchar (50);
declare e_salary int;
declare e_email varchar (50);
declare e_fulldata varchar (200);
declare emp_data cursor for 
select first_name,last_name,salary,email from employee;
declare continue handler for not found set done =1;
open emp_data;
execute_loop: loop
fetch emp_data into e_first_name,e_last_name,e_salary,e_email;
if done then 
leave execute_loop;
End if;
set e_fulldata = concat(e_first_name,' ',e_last_name,' ',e_salary,' ',e_email);
select e_fulldata as empdata;
end loop;
close emp_data;
End $$
delimiter ;
call new1();
select * from employee;
drop procedure new1;



delimiter $$
create procedure new2()
begin
Declare done int default 0;
declare emp_first_name varchar (50);
declare emp_last_name varchar (50);
declare emp_salary int;
declare emp_position varchar (200);
declare emp_cur cursor for 
select first_name,last_name,salary from employee;
declare continue handler for not found set done =1;
open emp_cur;
position_loop: loop
fetch emp_cur into emp_first_name,emp_last_name,emp_salary;
if done then 
leave position_loop;
End if;
select *,
case
when salary >= 80000 then  emp_position='Manager' 
when salary < 80000 and salary >=50000 then  emp_position='Associated' 
when salary < 50000 then emp_position= 'Executive'
else 'error'
end as progress
from employee;

-- set emp_position = concat(emp_first_name,' ',emp_last_name,' ',emp_salary,' ',emp_position); 
select emp_first_name,emp_last_name,emp_salary,emp_position as emp_position;
end loop;
close emp_cur;
End $$
delimiter ;
call new2();
select * from employee;
drop procedure new2;