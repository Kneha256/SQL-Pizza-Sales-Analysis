-- Calculate the percentage contribution of each pizza type to total revenue.

select (sum(order_details.quantity * pizzas.price) / (SELECT 
ROUND(SUM(order_details.quantity * pizzas.price),2) 
AS total_sales FROM order_details 
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id)) * 100 
as total_revenue, pizza_types.category
from pizza_types 
join pizzas
on pizzas.pizza_type_id=pizza_types.pizza_type_id 
join order_details
on order_details.pizza_id=pizzas.pizza_id 
group by pizza_types.category 
order by total_revenue desc;