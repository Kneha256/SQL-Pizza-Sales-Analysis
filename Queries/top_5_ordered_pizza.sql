-- List the top 5 most ordered pizza types along with their quantities.


select count(order_details.order_id) as total_order,pizzas.pizza_type_id,
sum(order_details.quantity) as total_quantity from pizzas join order_details 
on order_details.pizza_id=pizzas.pizza_id group by pizzas.pizza_type_id
order by total_order desc limit 5;