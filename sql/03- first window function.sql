-- 4.1: Customer revenue and rankings per region
--      Ranking functions (ROW_NUMBER, RANK, DENSE_RANK, PERCENT_RANK)
--      Use case: Top N customers by revenue per region.

SELECT
  c.region,
  c.customer_id,
  c.name,
  cust_rev.total_revenue,
  ROW_NUMBER()   OVER (PARTITION BY c.region ORDER BY cust_rev.total_revenue DESC) AS row_number_in_region,
  RANK()         OVER (PARTITION BY c.region ORDER BY cust_rev.total_revenue DESC) AS rnk,
  DENSE_RANK()   OVER (PARTITION BY c.region ORDER BY cust_rev.total_revenue DESC) AS dense_rnk,
  PERCENT_RANK() OVER (PARTITION BY c.region ORDER BY cust_rev.total_revenue DESC) AS pct_rank
FROM customers c
JOIN (
  SELECT customer_id, SUM(amount) AS total_revenue
  FROM transactions
  GROUP BY customer_id
) cust_rev ON c.customer_id = cust_rev.customer_id
ORDER BY c.region, cust_rev.total_revenue DESC;


-- How it works:
-- 1. Aggregates each customer’s total revenue from the transactions table.
-- 2.Joins this with the customers table to get customer details (name, region).
-- 3.Uses window functions to rank customers within their region:
--        .ROW_NUMBER → unique sequence regardless of ties.
--        .RANK → same rank for ties, but skips next number.
--        .DENSE_RANK → same rank for ties, but no skipping.
--        .PERCENT_RANK → percentile score (0 to 1) relative to peers.
-- 4.Results are sorted by region, then revenue descending.
