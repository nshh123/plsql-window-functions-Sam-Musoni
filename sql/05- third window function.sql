-- 4.3: Navigation functions (LAG, LEAD)
--      Use case: Month-over-month growth % per region.
--      Query (region / month totals + LAG):

WITH region_month AS (
  SELECT
    c.region,
    TRUNC(t.sale_date,'MM') AS month_start,
    SUM(t.amount) AS region_month_total
  FROM transactions t
  JOIN customers c ON t.customer_id = c.customer_id
  GROUP BY c.region, TRUNC(t.sale_date,'MM')
)
-- this first part does the following:
-- Groups sales data by region and month.
-- Produces a table where each row shows:
--     .region (e.g., North, South, East, West)
--     .month_start (first day of each month, acts as the period)
--     .region_month_total (total sales for that region in that month).
SELECT
  region,
  month_start,
  region_month_total,
  LAG(region_month_total) OVER (PARTITION BY region ORDER BY month_start) AS prev_month_total,
  CASE
    WHEN LAG(region_month_total) OVER (PARTITION BY region ORDER BY month_start) IS NULL THEN NULL
    WHEN LAG(region_month_total) OVER (PARTITION BY region ORDER BY month_start) = 0 THEN NULL
    ELSE ROUND( (region_month_total - LAG(region_month_total) OVER (PARTITION BY region ORDER BY month_start))
                /LAG(region_month_total) OVER (PARTITION BY region ORDER BY month_start) * 100, 2)
  END AS mom_growth_pct
FROM region_month
ORDER BY region, month_start;
-- this last part does the following:
-- Uses LAG() to fetch the previous month’s sales total for each region.
-- If there’s no previous month (first row), set growth to NULL to avoid dividing by zero
-- Otherwise: 
-- Shows, for each region and month:
