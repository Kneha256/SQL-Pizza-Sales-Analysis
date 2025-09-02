-- Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(quantity),0) from
(select sum(order_details.quantity) as quantity, orders.order_date from order_details join
orders on order_details.order_id=orders.order_id group by order_date) as order_quantity;