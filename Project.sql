CREATE DATABASE project;

USE project;
select * from pizza_sales;
select count(*) from pizza_sales;

#TOTAL_REVENUE
select sum(total_price) as total_revenue 
from pizza_sales;

#AVERAGE_ORDER_VALUE
select (sum(total_price)/count(distinct order_id)) as average_order_value 
from pizza_sales;

#TOTAL_PIZZAS_SOLD
select sum(quantity) as total_pizzas_sold 
from pizza_sales;

#TOTAL_ORDERS
select count(distinct order_id) as total_orders 
from pizza_sales;

#AVERAGE_PIZZAS_PER_ORDER
select (sum(quantity)/count(distinct order_id)) as avg_pizzas_per_order 
from pizza_sales;

#TOTAL_ORDERS_IN_EACH_DAYS
select dayname(str_to_date(order_date,'%Y-%m-%d')) as order_day, count(distinct order_id) as num_orders 
from pizza_sales 
group by order_day 
order by num_orders;

#TOTAL_ORDERS_IN_EACH_MONTHS
select monthname(str_to_date(order_date,'%Y-%m-%d')) as months, count(distinct order_id) as num_orders 
from pizza_sales 
group by months 
order by num_orders; 

#%AGE_OF_SALES_BY_PIZZA_CATEGORY
select pizza_category, round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as percentage_sales 
from pizza_sales 
group by pizza_category; 

#%AGE_OF_SALES_BY_PIZZA_SIZE
select pizza_size, round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as percentage_sales 
from pizza_sales 
group by pizza_size;

#%AGE_OF_SALES_BY_PIZZA_SIZE_OF_QUARTER1
select pizza_size, round(sum(total_price)*100/(select sum(total_price) from pizza_sales where quarter(str_to_date(order_date,'%Y-%m-%d'))=1),2) as percentage_sales 
from pizza_sales 
where quarter(str_to_date(order_date,'%Y-%m-%d'))=1 
group by pizza_size;

#TOTAL_PIZZAS_SOLD_BY_PIZZA_CATEGORY
select pizza_category, sum(quantity) 
from pizza_sales 
group by pizza_category;

#TOP5_BEST_SELLERS_BY_REVENUE
select pizza_name, round(sum(total_price),2) as total_revenue 
from pizza_sales 
group by pizza_name 
order by total_revenue desc 
limit 5;

#TOP5_BEST_SELLERS_BY_TOTAL_QUANTITY
select pizza_name, sum(quantity) as total_quantity 
from pizza_sales 
group by pizza_name 
order by total_quantity desc 
limit 5;

#TOP5_BEST_SELLERS_BY_TOTAL_ORDERS
select pizza_name, count(distinct order_id) as total_orders 
from pizza_sales 
group by pizza_name 
order by total_orders desc 
limit 5;

#TOP5_WORST_SELLERS_BY_REVENUE
select pizza_name, round(sum(total_price),2) as total_revenue 
from pizza_sales 
group by pizza_name 
order by total_revenue 
limit 5;

#TOP5_WORST_SELLERS_BY_TOTAL_QUANTITY
select pizza_name, sum(quantity) as total_quantity 
from pizza_sales 
group by pizza_name 
order by total_quantity 
limit 5;

#TOP5_WORST_SELLERS_BY_TOTAL_ORDERS
select pizza_name, count(distinct order_id) as total_orders 
from pizza_sales 
group by pizza_name 
order by total_orders 
limit 5;

