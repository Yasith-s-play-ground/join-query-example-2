#order count of each customer
SELECT c.id as customer_id, c.name as customer_name, COUNT(o.customer_id) as number_of_orders
FROM customer c
         INNER JOIN `order` o ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY number_of_orders DESC;

#Customer order count and total purchase amount
SELECT c.id as customer_id, c.name as customer_name, COUNT(o.customer_id) as number_of_orders,
FROM customer c
         INNER JOIN `order` o ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY number_of_orders DESC;

#best selling item
(SELECT 'Best Selling Item' as Item_Rank, item.bar_code, item.description, SUM(od.qty) as total_sales
 FROM order_detail od
          INNER JOIN item ON od.item_code = item.bar_code
 GROUP BY item.bar_code, item.description
 ORDER BY total_sales DESC
 LIMIT 1)
UNION

#worst selling item
(SELECT 'Worst Selling Item' as Item_Rank, item.bar_code, item.description, SUM(od.qty) as total_sales
 FROM order_detail od
          INNER JOIN item ON od.item_code = item.bar_code
 GROUP BY item.bar_code, item.description
 ORDER BY total_sales
 LIMIT 1);