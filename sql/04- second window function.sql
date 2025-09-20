-- 4.2: Aggregate window functions (SUM, AVG, MIN, MAX with frame comparisons)
--      Use case: Running monthly totals and frame-based 3-month moving averages.
--      Query (monthly totals + running cumulative + 3-month moving avg)

WITH monthly AS (
  SELECT
    TRUNC(sale_date,'MM') AS month_start,
    SUM(amount) AS month_total
  FROM transactions
  GROUP BY TRUNC(sale_date,'MM')
)
SELECT
  month_start,
  month_total,
  SUM(month_total) OVER (ORDER BY month_start
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_total,
  AVG(month_total) OVER (ORDER BY month_start
                        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3m
FROM monthly
ORDER BY month_start;


-- Interpretation:
-- The cumulative column shows how revenue accumulates over time. 
-- The 3-month moving average smooths month  volatility; e.g., March’s 13,983 average reflects 
-- Jan–Mar smoothing and helps identify whether March is an incremental spike or part of an upward trend.