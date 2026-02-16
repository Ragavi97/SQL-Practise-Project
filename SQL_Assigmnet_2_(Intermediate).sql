Set Sql_Safe_Updates = 0;
Select * from company_table; 

Select * from department_table;

Select * from employee_table;

#1. Query all rows from Department table?
Select * from department_table;

#2. Change the name of department with id = 1 to 'Management'?
update department_table set name= 'Management'
where id = 1;

#3. Delete employees with salary greater than 100000?
Delete from employee_table
where salary>100000;

#4. Query the names of companies?
Select name from company_table;

#5. Query the name and city of every employee?
select name, city from employee_table;

#6. Query all companies with revenue greater than 5000000?
Select name, revenue from company_table
where revenue >5000000;

#7. Query all companies with revenue smaller than 5000000?
Select name, revenue from company_table
where revenue <5000000;

#8. Query all companies with revenue smaller than 5000000, but you cannot use the '<' operator?
Select name, revenue from company_table
where revenue between 0 and 4900000;

#9. Query all employees with salary greater than 50000 and smaller than 70000?
Select name, salary from employee_table
where salary between 50001 and 69999;

#10. Query all employees with salary greater than 50000 and smaller than 70000, but you cannot use BETWEEN?
Select name, salary from employee_table
where salary>50000 and salary< 70000;

#11. Query all employees with salary equal to 80000?
select name, salary from employee_table
where salary = 80000;

#12. Query all employees with salary not equal to 80000?
select name, salary from employee_table
where salary <> 80000;

#13. Query all departments (each name only once)?
Select distinct name from department_table;

#14. Query names of all employees together with id of department they work in, but you cannot use JOIN?
select name, department_id from employee_Table;

#15. Query names of all employees together with id of department they work in, using JOIN?
select e.name, d.id from employee_table e
inner join department_table d
on d.id = e.department_id;

#16. Query name of every company together with every department?
select c.name company_name , d.name Department_name from company_table c
inner join department_table d 
on c.id = d.id;

#17. Query employee name together with the department name that they are not working?
select e.name employee_name, d.name Not_Working_department_name  from employee_table e
inner join department_table d 
on e.id <> d.id;

#18. Query names of every company and change the name of column to 'Company'?
Select name as Company from company_table;

#19. Query the city wise salary?
Select city, sum(salary) Total_salary from employee_table
group by city;

#20. Query the highest revenue company name?
Select name from company_table
order by revenue desc
limit 1;