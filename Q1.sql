# Q1. Find the total number of products sold by each store along with the store name.

select * from stores;

select * from orders;

select * from order_items; 

SELECT 
    s.store_id, s.store_name, SUM(oi.quantity) AS products_sold
FROM
    stores s
        JOIN
    orders o ON o.store_id = s.store_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY 1 , 2;

