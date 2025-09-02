-- find the top 3 pizza sizes that generated the highest revenue 
-- Solution: - L, M, S

select pizzas.size,round(sum(order_details.quantity * pizzas.price),2) as total_revenue from order_details join pizzas
on order_details.pizza_id=pizzas.pizza_id group by pizzas.size order by total_revenue desc limit 3;
