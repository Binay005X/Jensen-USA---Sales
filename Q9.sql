# 9. Find the median value of the price list. 

select * from order_items;

with a as 
	(select list_price,
	row_number() over(order by list_price) as pos,
	count(*) over() as n 
	from order_items)
select 
	case
		when n%2 = 0 then (select round(avg(list_price),0) from a where pos in ((n/2), (n/2+1))) -- For even pos
        else (select round(list_price,0) from a where pos = ((n+1)/2)) -- For odd pos
        end as median
from a 
limit 1;












