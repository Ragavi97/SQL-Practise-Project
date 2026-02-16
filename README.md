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

<h2> Goals of the Project</h2>

- Refresh my understanding of SQL fundamentals.
- Practice writing both simple and complex SQL queries.
- Understand relational database design and normalization.
- Gain experience with advanced SQL concepts like window functions and CTEs.
- Prepare for real-world data analysis and backend database work.

## SQL Query Examples

<details>
  <summary>1) Total Sales and Total Profit between 2011 and 2013</summary>

```sql
SELECT YEAR(a.OrderDate) AS Year, 
       SUM(b.Sales) AS Total_Sales, 
       SUM(b.Profit) AS Total_Profit
FROM tata_tb1 a
INNER JOIN tata_tb2 b
    ON a.OrderID = b.OrderID
WHERE YEAR(a.OrderDate) BETWEEN 2011 AND 2013
GROUP BY YEAR(a.OrderDate)
ORDER BY YEAR(a.OrderDate);
</details> <details> <summary>2) Total Sales, Profit, and Order Quantity by Country, State, Category, and Sub-Category</summary>
SELECT a.Country, 
       a.State, 
       b.Category, 
       b.SubCategory, 
       SUM(b.Sales) AS Total_Sales,
       SUM(b.Profit) AS Total_Profit,
       SUM(b.OrderQuantity) AS Total_OrderQuantity
FROM tata_tb1 a
INNER JOIN tata_tb2 b
    ON a.OrderID = b.OrderID
GROUP BY a.Country, a.State, b.Category, b.SubCategory;
</details> <details> <summary>3) Stored Procedure to Get Top 10 Customers Based on Total Sales</summary>
DELIMITER $$

CREATE PROCEDURE top10customersontotalsales(IN num INT)
BEGIN
    SELECT * FROM (
        SELECT *, RANK() OVER (ORDER BY Total_Sales DESC) AS rnk
        FROM (
            SELECT a.CustomerName, SUM(b.Sales) AS Total_Sales
            FROM tata_tb1 a
            INNER JOIN tata_tb2 b
                ON a.OrderID = b.OrderID
            GROUP BY a.CustomerName
        ) t1
    ) t2
    WHERE rnk <= 10;
END
$$ ```
</details> 
✅ Features of this README:





