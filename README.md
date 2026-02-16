# SQL-Practise-Project

<h2>Overview</h2>
This project is a personal SQL practice repository created to refresh and strengthen my SQL skills. It covers both basic and advanced SQL concepts using a set of tables designed to simulate real-world scenarios. The focus is on writing efficient queries, understanding database design, and practicing SQL operations from simple to complex.

<h2>Project Structure</h2>

The repository contains the following main components:

<h3>Tables</h3>
The project includes several tables to practice SQL concepts, including:
<ul>
<li>Company – Company table holds fields like  user_id, name, email, and registration_date.</li>
<li>Employee – Contains product details such as product_id, product_name, price, and category.</li>
<li>Department – Records orders placed by users with order_id, user_id, product_id, quantity, and order_date.</li>
</ul>
All tables are normalized and follow basic relational database principles.

# SQL Concepts Practiced

## Basic SQL
- **SELECT statements** for retrieving data
- **Filtering data** using `WHERE`
- **Sorting results** with `ORDER BY`
- **Aggregation** with `GROUP BY` and `HAVING`
- Using functions like `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- **Joining tables** with `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- **Subqueries** and nested queries
- Using `DISTINCT` to remove duplicates

## Advanced SQL
- **Complex joins** (`FULL OUTER JOIN`, `SELF JOIN`)
- **Window functions** (`ROW_NUMBER()`, `RANK()`, `LEAD()`, `LAG()`)
- **CTEs (Common Table Expressions)** and recursive queries
- **Advanced filtering** with `CASE` statements
- **Transactions** and ACID properties
- **Indexes** and query optimization
- **Views** and temporary tables
- **Stored procedures and functions** (optional, if applied)

<h2>Sample Queries</h2>

Here are some examples of SQL queries practiced in this project:

```
#1)Write query to get total sales and total profit between year 2011 and 2013?
select Year(a.OrderDate) Year, sum(b.Sales) Total_Sales, sum(b.Profit) Total_Profit  from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
where Year(a.OrderDate) between 2011 and 2013
group by Year(a.OrderDate)
order by Year(a.OrderDate);

#2)Write a query to get total sales, total profit and total order qty by country, state, category and sub-category?
select a.country, a.state, b.category, b.SubCategory, sum(b.Sales) Total_Sales,sum(b.Profit) Total_Profit,sum(b.OrderQuantity) Total_OrderQuantity 
from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID 
group by a.country, a.state, b.category, b.SubCategory;

#3)Write stored procedure to get top 10 customers based on total sales?
delimiter $$
create procedure top10customersontotalsales(
IN num int)
begin
select * from
(
select *,rank() over (order by Total_Sales desc)rnk from
(
Select a.CustomerName, sum(b.sales) Total_Sales from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
group by a.CustomerName
)t1)t2 where rnk <= 10;
end
$$

```

<h2> Goals of the Project</h2>

- Refresh my understanding of SQL fundamentals.
- Practice writing both simple and complex SQL queries.
- Understand relational database design and normalization.
- Gain experience with advanced SQL concepts like window functions and CTEs.
- Prepare for real-world data analysis and backend database work.

