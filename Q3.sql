# 3. Find the product with the highest total sales (quantity * price) for each category.

select * from order_items;
select * from categories;
select * from products;

with a as
	(select c.category_name, p.product_name,
	sum(oi.quantity * oi.list_price) as sales
	from categories c
	join products p
	on c.category_id = p.category_id
	join order_items oi
	on p.product_id = oi.product_id
	group by 1,2)
    
select category_name, product_name, sales from     
	(select *, 
    dense_rank() 
    over(partition by category_name 
    order by sales desc) rnk from a) b
    where rnk = 1;




