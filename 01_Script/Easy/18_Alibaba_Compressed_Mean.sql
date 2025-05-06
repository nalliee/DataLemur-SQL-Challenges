-- Alibaba Compressed Mean --

SELECT 
  ROUND(
    SUM(order_occurrences * item_count::DECIMAL) 
    / SUM(order_occurrences),1) AS mean
FROM items_per_order;
