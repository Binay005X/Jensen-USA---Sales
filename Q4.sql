# 4. Find the customer who spent the most money on orders.

select * from customers;
select * from orders; 
select * from order_items;

# Method 1
select c.customer_id, concat(c.first_name, ' ' ,c.last_name) as customer_name,
round(sum(oi.quantity * oi.list_price -(oi.quantity * oi.list_price * (oi.discount/100))),2) as amount_spent
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
group by 1,2
order by amount_spent desc
limit 1;


# Method 2
with a as 
	(select c.customer_id, concat(c.first_name, ' ' ,c.last_name) as customer_name,
	round(sum(oi.quantity * oi.list_price -(oi.quantity * oi.list_price * (oi.discount/100))),2) as amount_spent
	from customers c
	join orders o
	on c.customer_id = o.customer_id
	join order_items oi
	on o.order_id = oi.order_id
	group by 1,2
    order by amount_spent desc)

select * from 
(select *, 
rank() 
over(order by amount_spent desc) 
rnk from a) b
where rnk = 1;










