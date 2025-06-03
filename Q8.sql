# 8. Find the top 3 most sold products in terms of quantity.

select * from orders;
select * from order_items;
select * from products;

# METHOD - 1
select p.product_id, p.product_name, 
sum(oi.quantity) as quantity_sold 
from products p
join order_items oi
on p.product_id = oi.product_id
group by 1,2
order by 3 desc
limit 3;


# METHOD - 2

select * from 
	(select p.product_id, p.product_name, 
	sum(oi.quantity) as quantity_sold,
    rank() over(order by sum(oi.quantity) desc) as rnk
	from products p
	join order_items oi
	on p.product_id = oi.product_id
	group by 1,2) as product_rank
where rnk <= 3;






