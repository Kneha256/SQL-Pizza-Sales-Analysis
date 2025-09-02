-- Join the necessary tables to find the total quantity of each pizza category ordered.

select sum(order_details.quantity) as quantity,count(order_details.order_id) as total_orders,
pizza_types.category from pizzas join pizza_types on pizzas.pizza_type_id=pizza_types.pizza_type_id 
join order_details on order_details.pizza_id=pizzas.pizza_id group by
pizza_types.category order by quantity desc;

