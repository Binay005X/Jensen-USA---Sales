# 12. Identify the customers who have ordered all types of products (i.e., from every category).

# METHOD - 1

with customer_categories as	
    (select c.customer_id, concat(c.first_name, ' ',c.last_name) as customer_name, ct.category_id
	from customers c
	join orders o
	on c.customer_id = o.customer_id
	join order_items oi
	on o.order_id = oi.order_id
	join products p
	on oi.product_id = p.product_id
	join categories ct
	on p.category_id = ct.category_id),
    
category_counts as (
	select customer_id, customer_name, 
    count(distinct category_id) as customer_category_count
    from customer_categories
    group by 1,2),
    
total_categories as 
	(select count(*) as total_category_count
    from categories)
 
    select cc.customer_id, cc.customer_name
    from category_counts cc
    join total_categories tc
    on cc.customer_category_count = tc.total_category_count;


# METHOD - 2 - [Class]
select customers.customer_id, customers.first_name, count(order_items.product_id)
from customers join orders
on customers.customer_id = orders.customer_id
join order_items
on orders.order_id = order_items.order_id
join products
on order_items.product_id = products.product_id
group by customers.customer_id, customers.first_name
having count(distinct(category_id)) = (select count(category_id) from categories);
    
    


