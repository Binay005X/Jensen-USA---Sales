# 6. Find the total number of orders placed by each customer per store.

select * from stores;
select * from customers;
select * from orders;

# METHOD - 1
select c.customer_id, concat(first_name, ' ', last_name) as customer_name, s.store_name, 
count(o.order_id) as product_count
from customers c
join orders o
on c.customer_id = o.customer_id
join stores s
on o.store_id = s.store_id
group by 1,2,3;

# METHOD - 2
select  distinct c.customer_id, 
concat(first_name, ' ', last_name) as customer_name, s.store_name, 
count(o.order_id) over(partition by c.customer_id, s.store_name) as product_count
from customers c
join orders o
on c.customer_id = o.customer_id
join stores s
on o.store_id = s.store_id;








 