# 10. List all products that have never been ordered.(use Exists)

select * from products;
select * from orders;
select * from order_items;

# METHOD - 1
select p.product_id, p.product_name, oi.order_id
from products p
left join order_items oi
on p.product_id = oi.product_id
group by 1,2,3
having order_id is null;

# METHOD - 2

SELECT 
    p.product_id, p.product_name
FROM
    products p
WHERE
    NOT EXISTS( SELECT 
            p.product_id
        FROM
            order_items oi
        WHERE
            p.product_id = oi.product_id);









