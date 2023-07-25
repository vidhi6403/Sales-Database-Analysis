
SELECT * FROM pizza_sales

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_sale


--Average Order Value
SELECT SUM(Total_price) / COUNT(DISTINCT Order_id) AS Avg_Order_Value FROM pizza_sales


--Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza FROM pizza_sales


--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_orders from pizza_sales


--Average Pizzas per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))  AS Avg_pizza_per_order FROM pizza_sales


--Daily trend for total orders
SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
group by DATENAME(DW, order_date)


--Monthly trend for total orders
SELECT DATENAME(MONTH, order_date) as Month_name, COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
group by DATENAME(MONTH, order_date)
order by Total_orders desc


--percentage of sales by category
SELECT pizza_category, SUM(total_price)*100  / (select sum(total_price)  from pizza_sales where MONTH(order_date)=1)as Pct
from pizza_sales
where MONTH(order_date)=1
group by pizza_category



--percentage of sales by size
SELECT pizza_size, SUM(total_price)*100  / (select sum(total_price)  from pizza_sales )as Pct
from pizza_sales
group by pizza_size
order by pct desc


--Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC



--Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


--Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC



--Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
