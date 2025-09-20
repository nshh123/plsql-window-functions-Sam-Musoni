-- 4.1: Customer revenue and rankings per region
-- Ranking functions (ROW_NUMBER, RANK, DENSE_RANK, PERCENT_RANK)
-- Use case: Top N customers by revenue per region.

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


-- Interpretation:
-- ROW_NUMBER gives strict ordering (useful when selecting a single top customer). RANK and DENSE_RANK -- differ when ties are present — RANK() leaves gaps while DENSE_RANK() does not. PERCENT_RANK() maps -- ranks to [0,1], useful for relative percentile filtering.
