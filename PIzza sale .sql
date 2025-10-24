drop table pizza;
create table pizza(
pizza_id int  primary key ,
order_id int ,	
pizza_name_id	varchar(50),
quantity int ,
order_date	date,
order_time	time,
unit_price	decimal(10,2),
total_price	decimal(10,2),
pizza_size	varchar(20),
pizza_category varchar(50),
pizza_ingredients	varchar(100),
pizza_name varchar(50)
);

select * from pizza ;
copy pizza( pizza_id ,	order_id ,	pizza_name_id	, quantity, 
order_date,	order_time,	unit_price	,total_price ,	pizza_size,	pizza_category	
,pizza_ingredients	,pizza_name)
from 'C:\Program Files\PostgreSQL\17\data\pizza_sales_excel_file (1).csv'
csv header ;


--total revenue
1
select sum(total_price) as total_revenue from pizza;

--Average order value 
2 
select (sum(total_price)/count(distinct order_id)) as average_ordervalue from pizza;

-- total pizza sold 
3

select sum(quantity) as total_pizza from pizza;

--total orders 
4
select count(distinct order_id) from pizza;

--Average pizza per order 
5
SELECT ROUND(SUM(quantity)::numeric / COUNT(DISTINCT order_id), 2) AS average_orderid
FROM pizza

--daily trend for total orders 
6
select to_char(order_date,'day') as dayof , count(distinct order_id ) from pizza
group by dayof;

--monthly trend for total orders 
7
select to_char(order_date,'Month') as added ,  count(distinct order_id )  from pizza
group by added ;

-- percentage of sales by specific category ,trend for specific month 
8
select pizza_category , sum(total_price) ,(sum(total_price)*100/(select sum(total_price)from pizza  where EXTRACT (MONTH FROM ORDER_DATE)=1)) from pizza 
where EXTRACT (MONTH FROM ORDER_DATE )=1
group by pizza_category ;

-- Rounding of 
9 
select pizza_size , sum(total_price) ,ROUND(sum(total_price)*100/(select sum(total_price)from pizza 
where EXTRACT (MONTH FROM ORDER_DATE)=1),2) 
from pizza 
where EXTRACT (MONTH FROM ORDER_DATE )=1
group by pizza_size ;

-- percentage of sales by pizza size ,trend for specific month for quarter 

10 
select pizza_size , sum(total_price) ,
ROUND(sum(total_price)*100/(select sum(total_price)from pizza  where EXTRACT (QUARTER FROM ORDER_DATE)=4),2) 
from pizza 
where EXTRACT (MONTH FROM ORDER_DATE )=1
group by pizza_size 

--top 5 best pizza by revenue 
11  
SELECT pizza_name , sum(total_price) as total_revenue from pizza
group by pizza_name
order by total_revenue desc
limit 5;  

-- --top 5 best pizza by quantity 

12 
SELECT pizza_name , sum(quantity) as total_quantity from pizza
group by pizza_name
order by  total_quantity   desc
limit 5;  

-- Bottom 5 pizza by total quantity sold 
13 
 SELECT pizza_name , sum(quantity) as total_quantity from pizza
group by pizza_name
order by  total_quantity   desc
limit 5;