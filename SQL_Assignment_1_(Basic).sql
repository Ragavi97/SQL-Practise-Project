Select * from ele_store1;

#1) What is total number of orders placed?
select count(OrderId) from ele_store1;

#2) What are the unique channels present and how many are there?
select channel, count(channel) Total_channel from ele_store1
group by Channel;

#3)How many cities are there?
select count(distinct City) Total_Cities from ele_store1;

#4)Query the total cities count by Country?
select Country, Count(distinct City) Total_Cities from ele_store1
group by Country;

#5)How many products are there?
Select count(distinct ProductName) Total_Products from ele_store1;

#6)Query the total sales and total proft?
select sum(Sales) Total_Sales, Sum(Profit) Total_Profit from ele_store1;

#7) Query the total sales by region and country?
Select Region, Country, Sum(Sales) Total_Sales from ele_store1
group by Region, Country;

#8) Query the total order qty by promotion name?
Select PromotionName,Sum(OrderQty) Total_OrderQty from ele_store1
group by PromotionName;

#9) How much the total sales happened in Asia region?
Select Region,sum(Sales) Total_Sales from ele_store1
Where Region = 'Asia'
group by Region;

#10) How much proft got in Asia region and India?
select  Region,Country, Sum(Profit) Total_Profit from ele_store1
where Region = 'Asia' and Country = 'India'
group by Region, Country;

#11) Query the total order qty by Manufacturer and Product Name?
Select Manufacturer, ProductName, Sum(OrderQty)  Total_orderqty from ele_store1
group by  Manufacturer, ProductName;

#12) Query the total order quantity greater than 27 by city?
Select City, Sum(OrderQty) Total_Orderqty from ele_store1
group by City
having Sum(OrderQty) >27;

#13) How much total sales happened in China and Beijing?
Select Country, City, Sum(Sales) Total_Sales from ele_store1
where Country = 'China' and City = 'Beijing'
group by Country, City;

#14) How much total sales happened in Asian Holiday Promotion?
Select PromotionName, Sum(Sales) Total_Sales from ele_store1
where PromotionName='Asian Holiday Promotion'
Group by PromotionName;

#15) How much total proft value by Contoso, Ltd Manufacturer?
Select Manufacturer,Sum(Profit) Total_Profit from ele_store1
where Manufacturer = 'Contoso, Ltd'
group by Manufacturer;

#16) Query the total sales and total order qty by  productcategory?
Select productcategory, Sum(Sales) Total_Sales, Sum(OrderQty) Total_OrderQty from ele_store1
group by productcategory;

#17) Query the total sales value in between 1057 and 26700 by Region?
Select Region, Sum(Sales)Total_Sales from ele_store1
Where Sales between 1057 and 26700
group by Region;

#18) How many orders placed in Pittsfeld city?
Select count(OrderID) Total_Orders from ele_store1
where City = 'Pittsfield';

#19) Query the total sales and total proft by region, country and city?
Select Sum(Sales) Total_Sales, Sum(Profit) Total_Profit,City, Country, Region from ele_store1
Group by Region, Country, City;

#20) Query the total unit cost and total price by  productcategory, productcategory?
Select Sum(UnitCost) Total_UnitCost, Sum(Price) Total_Price, productcategory, productcategory from ele_store1
group by  productcategory, productcategory;

             



