# 5. Find the highest-priced product for each category name.

select * from products;

# METHOD -1 
select * from 
	(select c.category_name, p.product_name, p.list_price,
	max(p.list_price) over(partition by c.category_name) as max_price  
	from categories c
	join products p
	on c.category_id = p.category_id) b
    where list_price = max_price;
    

# Method - 2 
select * from 
	(select c.category_name, p.product_name, p.list_price,
	dense_rank() over(partition by c.category_id order by list_price desc) as rnk  
	from categories c
	join products p
	on c.category_id = p.category_id) b
where rnk = 1;



		
