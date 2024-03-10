use sql_project;

#SHOW TABLE
SELECT * FROM pizza_table;

#SHOW SUM OF TOTAL REVENUE . 
select sum(total_price) from pizza_table;

#CHECK THE NAME HAS CHANGED OR NOT
select * from pizza_table;

#AVERAGE ORDER values
select distinct count(order_id) from pizza_table;

#SUM OF TOTAL REVENUE
select sum(total_price)/count(distinct order_id) from pizza_table;

#TOTAL PIZZA SOLD
select sum(quantity) from pizza_table;

#TOTAL ORDER PLACED
select count(distinct order_id) as total_order from pizza_table;

#AVERAGE PIZZA PER ORDER
select sum(quantity)/count(distinct order_id) from pizza_table;

#CONVERT THE ROUND VALUE INTO DECIMAL VALUE
#select  cast(cast(sum(quantity) as Decimal (10,2) /
#cast(count(distinct order_id) as decimal (10,2)))  from pizza_table;

#DAILY TREND FOR TOTAL ORDERS -- HOW MANY TOTAL NUMBER OF ORDERS PLACED IN EACH WEEK            
select dayname(order_date) as order_day , count(distinct order_id ) as total_orders
from pizza_table
group by dayname(order_date);

#MONTHLY TREND FOR TOTAL ORDERS:
select monthname(month (order_date)) as Month_day , count(distinct order_id) as total_orders
from pizza_table
group by monthname( month(order_date))
order by total_orders desc;

#PERCETNAGE OF SALES BY PIZZA CATEGORY
select pizza_category,sum(total_price) AS TOTAL_SALES ,sum(total_price)*100 / (select sum(total_price) from pizza_table)  As Result
from pizza_table
group by pizza_category;

#FILTER THE EXISTING DATA ROW BY ROW- WHERE CLAUSE
select pizza_category,sum(total_price) AS TOTAL_SALES ,sum(total_price)*100 / (select sum(total_price) from pizza_table)  As Result
from pizza_table
where month(order_date)=1
group by pizza_category;

#CHARTS REQUIREMENT - PERCETNAGE OF SALES BY PIZZA SIZE
select pizza_size,sum(total_price) AS TOTAL_SALES , cast(sum(total_price)*100 / 
(select sum(total_price) from pizza_table)  As decimal (10,2)) as PCT
from pizza_table
where month(order_date)=1
group by pizza_size;

#TOP 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDERS
select pizza_name, sum(total_price) as total_revenue from pizza_table
 group by pizza_name order by total_revenue desc limit 5;

#BOTTOM 5  SELLERS BY REVENUE , TOTAL QUANTITY AND TOTAL ORDERS
select pizza_name, sum(total_price) as total_revenue from pizza_table
 group by pizza_name order by total_revenue asc limit 5;
 
 #QUANTITY WISE TOP 5 SELLER
 select pizza_name, sum(quantity) as total_Quantity from pizza_table
 group by pizza_name order by total_Quantity asc limit 5;
 
 #QUANTITY WISE BOTTOM 5 SELLER
select pizza_name, sum(quantity) as total_Quantity from pizza_table
 group by pizza_name order by total_Quantity desc limit 5;
 
 -- THANK YOU--


