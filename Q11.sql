# 11. List the names of staff members who have made more sales 
# than the average number of sales by all staff members.

# METHOD - 1 --- Wrong Method
# Sale by each staff
	select s.staff_id, s.first_name,
	round(sum(oi.quantity * oi.list_price -(oi.quantity * oi.list_price * (oi.discount/100))),2) as total_sales  
	from staffs s
	left join orders o
	on s.staff_id = o.staff_id
	left join order_items oi
	on o.order_id = oi.order_id
	group by 1,2;

# Staff who sold more than avg sale 
   
# METHOD - 2

with a as 
	(select staffs.staff_id, staffs.first_name,
	coalesce(sum(order_items.list_price * order_items.quantity),0) as total_sales
	from staffs left join orders
	on orders.staff_id = staffs.staff_id
	left join order_items
	on orders.order_id = order_items.order_id
	group by staffs.staff_id, staffs.first_name)

select * from a
where total_sales > (select avg(total_sales) from a);


