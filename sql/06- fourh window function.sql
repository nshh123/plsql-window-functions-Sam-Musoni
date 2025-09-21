-- 4.4 Distribution functions (NTILE, CUME_DIST)
--     Use case: Segmenting customers into quartiles for marketing prioritization.
--     Query (customer total revenue + NTILE + CUME_DIST):

WITH cust_revenue AS (
  SELECT c.customer_id, c.name, SUM(t.amount) AS total_revenue
  FROM customers c
  JOIN transactions t ON c.customer_id = t.customer_id
  GROUP BY c.customer_id, c.name
)

-- this first part does the following:
-- It combines customers with their transactions.
-- For each customer, it adds up (SUM) all the money (t.amount) they spent/earned.
-- The result is a list of customers with their total revenue.

SELECT
  customer_id,
  name,
  total_revenue,
  NTILE(4) OVER (ORDER BY total_revenue DESC) AS quartile_desc,
  CUME_DIST() OVER (ORDER BY total_revenue DESC) AS cume_dist_desc
FROM cust_revenue
ORDER BY total_revenue DESC;

-- this last part does the following:

-- using NTILE(4):
-- It Splits customers into 4 equal groups (quartiles) based on revenue.
-- Quartile 1 = top 25% highest revenue, Quartile 4 = bottom 25%.

-- using CUME_DIST():
-- Calculates the cumulative distribution:
-- For each customer, it shows what fraction of all customers have revenue greater than or equal to theirs.
-- Values go from 0 < cume_dist ≤ 1.

-- using ORDER BY: 
-- Finally, it lists customers from highest to lowest total revenue.
