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


-- How it works:
-- Aggregates sales by month (month_total).
-- Calculates a cumulative sales total (cumulative_total) — running sum across months.
-- Computes a 3-month moving average (moving_avg_3m) to smooth fluctuations and show trends.
-- Outputs results sorted by month.
