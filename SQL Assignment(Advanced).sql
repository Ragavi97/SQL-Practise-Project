select *  from tata_tb1;

select *  from tata_tb2;

#1) Write a query to calculate the total records in both tables?
Select Count(*) Total_Records from
(Select OrderID from tata_tb1
union all
Select OrderID from tata_tb2) as Combined_Records;

#2) Write a query to calculate the total unique count of customers?
select  count(distinct CustomerName) Total_UniqueCust from tata_tb1;

#3) Write a query to fetch the oldest order date and latest order date?
Select max(OrderDate) Oldest_Order_Date, min(OrderDate) latest_Order_Date from tata_tb1;

#4) Write query to get years in table?
select Year(OrderDate) years from tata_tb1
group by Year(OrderDate)
order by Year(OrderDate);

#5) Write a query to get the no. of regions and display the region names?
select Region, Count(Region) Total_Region from tata_tb1
group by Region;

#6) Write a query to get the no. of countries and display the country names?
select Country, count(Country) Total_Country from tata_tb1
group by Country;

#7) Write a query to get the no. of states and display the state names?
select State, count(State) Total_State from tata_tb1
group by State;

#8) Write a query to get the no. of cities and display the city names?
select City, count(City) Total_City from tata_tb1
group by City;

#9) Write a query to calculate the total count of customers?
Select count(distinct CustomerName) CustCount from tata_tb1;

#10)Write a query to calculate the total count of products?
Select count(distinct ProductName) CustCount from tata_tb2;

#11)Write a query to calculate total sales, total profit and total order quantity
select sum(Sales) Total_Sales,sum(Profit) Total_Profit,sum(OrderQuantity) Total_OrderQty from tata_tb2;

#12)Write a query to calculate the total sales amount for each category. Display the 
#category, total sales, and total order qty and order by total sales from highest to lowest?
select category, sum(sales) total_order, sum(OrderQuantity) total_OrderQuantity from tata_tb2
group by category
Order by sum(sales) desc;

#13)Write a query to calculate the total profit amount for each category. Display the 
#category, total profit, and total order qty and order by total profit from highest to lowest?
select category, sum(profit) total_profit, sum(OrderQuantity) total_OrderQuantity from tata_tb2
group by category
Order by sum(profit) desc;

#14)Write a query to fetch the subcategories where total sales are greater than 100000?
select SubCategory,Sum(sales) Total_Sales  from tata_tb2
group by SubCategory
having Sum(sales) >100000;

#15)Write a query to fetch the products where total profit is greater than 1000?
select ProductName,Sum(Profit) Total_Profit from tata_tb2
group by ProductName
having Sum(Profit) >1000;

#16)Write a query to get the total sales and total profit for Office Supplies category?
Select Sum(sales)Total_Sales, Sum(Profit)Total_Profit from tata_tb2
where Category = 'Office Supplies';

#17)Write a query to get the total sales and total profit for Furniture category and the Tables and Bookcases sub-categories ?
Select Sum(sales)Total_Sales, Sum(Profit)Total_Profit from tata_tb2
where Category = 'Furniture' and 
SubCategory in ('Tables' , 'Bookcases');

#18)Write a query to get the total sales and total profit for Technology category and the Accessories, Copiers, Phones sub-categories ?
Select Sum(sales)Total_Sales, Sum(Profit)Total_Profit from tata_tb2
where Category = 'Technology' and 
SubCategory in (' Accessories', 'Copiers', 'Phones');

#19)Write a query to get total sales and total profit by Region, Segment?
Select a.Region, a.Segment, Sum(b.sales)Total_Sales, Sum(b.Profit)Total_Profit from tata_tb1 a
inner join tata_tb2 b 
on a.OrderID = b.OrderID
group by a.Region, a.Segment ;

#20)Write a query to get total sales and total profit by Country, State and city?
Select a.Country, a.State, a.City, Sum(b.sales)Total_Sales, Sum(b.Profit)Total_Profit from tata_tb1 a
inner join tata_tb2 b 
on a.OrderID = b.OrderID
group by a.Country, a.State, a.City ;

#21)Write a query to get total sales and total orderqty by CustomerName sort it by totalsales from highest to lowest?
Select a.CustomerName, Sum(b.sales)Total_Sales, Sum(b.OrderQuantity)Total_OrderQuantity from tata_tb1 a
inner join tata_tb2 b 
on a.OrderID = b.OrderID
group by a.CustomerName
order by Sum(b.sales) desc ;

#22) Identify the top 5 products with the highest sales (by sales amount). Show the product name, total sales, and total qty?
Select ProductName, sum(Sales) Total_Sales, sum(OrderQuantity) Total_OrderQuantity from tata_tb2
group by ProductName
order by sum(Sales) desc
limit 5;

#23)Write a query to get total sales by City having sales greater than 2000?
Select a.City, sum(b.Sales) Total_Sales from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
group by a.City
having sum(b.Sales)>2000;

#24)Write a query to get total sales by CustomerName having sales greater than 3000?
Select a.CustomerName, sum(b.Sales) Total_Sales from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
group by a.CustomerName
having sum(b.Sales)>3000;

#25)Write a query to get total sales and total profit by shipmode?
Select a.ShipMode, sum(b.Sales) Total_Sales,sum(b.Profit) Total_Profit from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
group by a.ShipMode

#26)Write a query to get total sales for North and central region?
Select a.Region, sum(b.Sales) Total_Sales from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
where a.Region in ('North','central')
group by a.Region;

#27)Write a query to get total sales and total profit for Italy and Spain countries?
select a.Country, sum(b.Sales) Total_Sales, sum(b.Profit) Total_Profit  from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
where a.Country in ('Italy','Spain')
group by a.Country;

#28)Write a query to get the total sales and total profit for each year?
select Year(a.OrderDate) Year, sum(b.Sales) Total_Sales, sum(b.Profit) Total_Profit  from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
group by Year(a.OrderDate)
order by Year(a.OrderDate);


#29) Find the top 10 customers who spent the most across all transactions. Display the customer name, total amount spent, and number of orders placed?
select a.CustomerName, sum(b.Sales) Total_amount_spent, sum(b.OrderQuantity) Total_OrderQuantity from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
group by a.CustomerName
order by sum(b.Sales) desc
limit 5;

#30)Write a query to find which products are most preferred by customers based on the total sales. Display customer name, favorite product (top 3 products per each 
#customer), and total sales on that product?
#Subquery method
select * from
(
select *,rank() over(order by Total_Sales desc)rnk from
(
select a.CustomerName, b.ProductName as Favorite_Product, sum(b.sales) Total_Sales from tata_tb1 a
inner join tata_tb2 b on a.OrderID = b.OrderID
group by a.CustomerName, b.ProductName
)t1)t2 where rnk<= 3;

#CTE method
with t1 as (
select a.CustomerName, b.ProductName as Favorite_Product, sum(b.sales) Total_Sales from tata_tb1 a
inner join tata_tb2 b on a.OrderID = b.OrderID
group by a.CustomerName, b.ProductName),
t2 as (select *,rank() over(order by Total_Sales desc)rnk from t1)
select * from t2 where rnk<= 3;

#31)Write a query to get 7th rank customer name based on total sales? Display customer name, sales amount and rank.
#SubqueryMethod
select * from (
select *, rank() over(order by Total_Sales desc)rnk from 
(
select a.CustomerName, sum(b.Sales) Total_Sales from
tata_tb1 a inner join tata_tb2 b
on a.OrderID= b.OrderID
group by a.CustomerName)t1)t2
where rnk = 7;

#CTEMethod
with t1 as (
		   select a.CustomerName, sum(b.Sales) Total_Sales from
           tata_tb1 a inner join tata_tb2 b
           on a.OrderID= b.OrderID
           group by a.CustomerName),
      t2 as (
            select *, rank() over(order by Total_Sales desc)rnk from t1)
select * from t2 where rnk = 7;            
                   
#32)Write query to get total sales and total profit between year 2011 and 2013?
select Year(a.OrderDate) Year, sum(b.Sales) Total_Sales, sum(b.Profit) Total_Profit  from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID
where Year(a.OrderDate) between 2011 and 2013
group by Year(a.OrderDate)
order by Year(a.OrderDate);

#33)Write a query to get total sales, total profit and total order qty by country, state, category and sub-category?
select a.country, a.state, b.category, b.SubCategory, sum(b.Sales) Total_Sales,sum(b.Profit) Total_Profit,sum(b.OrderQuantity) Total_OrderQuantity 
from tata_tb1 a
inner join tata_tb2 b
on a.OrderID = b.OrderID 
group by a.country, a.state, b.category, b.SubCategory;

#34)Write stored procedure to get top 10 customers based on total sales?
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

#35)Create a virtual table (view) by using OrderID, OrderDate, CustomerName, Region, country, sales, profit and order qty?
create view Tata_sales_tb as (
select a.OrderID, a.OrderDate, a.CustomerName,a.Region,a.country, b.sales, b.profit, b.OrderQuantity from tata_tb1 a
inner join tata_tb2 b on a.OrderID = b.OrderID);

#36)Create a stored procedure to get region sales?
delimiter $$
create procedure RegionSales()
begin
select a.Region, sum(b.sales) Total_Region_sales from tata_tb1 a
inner join tata_tb2 b on a.OrderID = b.OrderID
group by a.Region;
end
$$