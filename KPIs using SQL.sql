select * from pizza_sales;

--Total Revenue 

select sum(total_price) AS total_revenue from pizza_sales; 

-- Average Order Value
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales; 

-- Total pizza sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales; 

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales 


-- Average Pizzas Per Order
select cast(cast(sum(quantity) AS decimal(10,2)) / 
	  cast(count(distinct order_id) AS decimal(10,2)) as decimal(10,2)) 
	  as Average_Pizzas_Per_Order 
from pizza_sales  


--daily trend for orders
select datename(DW,order_date) as order_day, count(distinct order_id) as Total_orders from pizza_sales
group by datename(DW,order_date) 


--Monthly trend for orders
select datename(Month,order_date) as Month_name, count(distinct order_id) as Total_orders from pizza_sales
group by datename(Month,order_date) 


--% of sales by Pizza Category
select pizza_category , 
cast(sum(total_price) As decimal(10,2)) as Total_Revenue ,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) As decimal(10,2)) AS PCT
from pizza_sales
group by pizza_category 


--% of sales by Pizza Size
select pizza_size , 
Cast(sum(total_price) AS decimal(10,2)), 
CAST(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) AS decimal(10,2) ) AS PCT
from pizza_sales
group by pizza_size
ORDER BY pizza_size 


--Total_pizzas_sold by Pizza Category
select pizza_category , sum(quantity)  as Total_pizzas_sold 
from pizza_sales
group by pizza_category
ORDER BY Total_pizzas_sold DESC

--Top 5 pizzas by Revenue
select TOP 5 pizza_name , sum(total_price) AS total_revenue
from pizza_sales
group by pizza_name
order by 2 desc


--Bottom 5 pizzas by Revenue
select TOP 5 pizza_name , sum(total_price) AS total_revenue
from pizza_sales
group by pizza_name
order by 2 ASC


--Top 5 pizzas by Quantity
select TOP 5 pizza_name ,sum(quantity) AS Total_Pizas_Sold
from pizza_sales
group by pizza_name
order by 2 Desc


--Bottom 5 pizzas by Quantity
select TOP 5 pizza_name , sum(quantity)  AS Total_Pizas_Sold
from pizza_sales
group by pizza_name
order by 2 ASC


--Bottom 5 pizzas by Total_orders
select TOP 5 pizza_name , count(distinct order_id)  AS total_orders
from pizza_sales
group by pizza_name
order by 2 ASC


--Top 5 pizzas by Total_orders
select TOP 5 pizza_name , count(distinct order_id)  AS total_orders
from pizza_sales
group by pizza_name
order by 2 desc

