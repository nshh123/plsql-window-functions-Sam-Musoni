# PL/SQL Window Functions Mastery Project

## _Author_

Name: Musoni Nshuti Sam  
ID: 28857  
Group: D

## Problem Definition

**Business context:**
A regional specialty-coffee retail chain (retail + espresso machine sales) operating in Rwanda. Sales & Marketing needs a compact analytics pipeline to measure product/region performance, detect trends, and segment customers for targeted campaigns.

**Data challenge (2–3 sentences):**
Sales are recorded as transactions (customer, product, date, amount). The business must identify top products by region & quarter, track running monthly totals and month-over-month growth, compute customer value quartiles for marketing, and smooth short-term volatility with moving averages — all using analytic/window functions.

**Expected outcome:**
Actionable insights: top products per region/quarter for merchandising, monthly trend and growth metrics for forecasting, customer quartile segments for targeted promotions, and smoothed 3-month averages to inform inventory and marketing cadence.

## Success criteria

1. Produce ranked top-5 lists per region/quarter using RANK() / DENSE_RANK().
2. Generate cumulative monthly total table of sales using SUM() OVER (...).
3. Generate Month-over-month (MoM) growth percentage using LAG() for region/month.
4. Customer quartiles using NTILE(4) (goal: segment customers into 4 revenue buckets).
5. 3-month moving averages using AVG() OVER (...) or a 3-row frame (goal: 3-month moving avg of monthly sales).

---

## Database Schema

The following schema was designed to support the analysis:

- **CUSTOMERS**(`customer_id`, `first_name`, `last_name`, `email`)
- **PRODUCTS**(`product_id`, `product_name`, `category`, `price`)
- **TRANSACTIONS**(`transaction_id`, `customer_id`, `product_id`, `quantity`, `transaction_date`)

> Each transaction records which customer purchased which product, in what quantity, and on what date.

📌 _ER Diagram_

Click [here](screenshots/18-ER%20Diagram.png) to view ER Diagram

---

## SQL Scripts

All SQL scripts are located in the [`/sql`](./sql) folder:

- [schema.sql](sql/01-%20schema.sql) → DDL for tables and constraints
- [inserts.sql](sql/02-%20insert.sql) → Sample data for demonstration

### 🔍 Analytical Queries using Window Functions & Results

### 1. Rank Top Customers by Total Spending

Click [here](sql/03-%20first%20window%20function.sql) to view sql query  
Click [here](screenshots/10-first%20windows%20function.png) to view screenshot of query being executed in oracle (results)

_Interpretation: (2–3 sentences)_  
ROW_NUMBER gives strict ordering (useful when selecting a single top customer).
RANK and DENSE_RANK -- differ when ties are present — RANK() leaves gaps while DENSE_RANK() does not.
PERCENT_RANK() maps -- ranks to [0,1], useful for relative percentile filtering.

---

### 2. Calculate Month-over-Month Sales Growth

Click [here](sql/04-%20second%20window%20function.sql) to view sql query  
Click [here](screenshots/11-second%20windows%20function.png) to view screenshot of query being executed in oracle (results)

_Interpretation: (2–3 sentences)_  
The cumulative column shows how revenue accumulates over time.
The 3-month moving average smooths month volatility; e.g., March’s 13,983 average helps identify whether March is an incremental spike or part of an upward trend.

---

### 3. Moving Average of Sales (3-Month Window)

Click [here](sql/05-%20third%20window%20function.sql) to view sql query  
Click [here](screenshots/12-third%20windows%20function.png) to view screenshot of query being executed in oracle (results)

_Interpretation: (2–3 sentences)_
LAG() exposes the previous month’s total so we can compute MoM growth readily. Some regions show
large swings (e.g., Butare’s +546% in April) indicating one or two large ticket sales (e.g., Espresso Machine) created spikes — this should be investigated as either sales campaigns or one-off purchases.

---

### 4. Customer Segmentation (NTILE Example)

Click [here](sql/06-%20fourh%20window%20function.sql) to view sql query  
Click [here](screenshots/14-fourth%20windows%20function.png) to view screenshot of query being executed in oracle (results)

_Interpretation: (2–3 sentences)_  
NTILE(4) divides customers into quartiles; the top quartile (4) are high-value customers to target with premium offers. CUME_DIST() gives the cumulative distribution percentile useful for selecting thresholds (e.g., top 20% customers for a loyalty program).

---

## Insights

### Descriptive — What happened?

- Total sample period sales = 89,000. Region breakdown: Kigali 46,150, Butare 29,600, Gisenyi 13,250.
- Top products by total sales: Espresso Machine (41,000), Coffee Beans (29,100) — equipment and core consumables dominate revenue.
- Monthly behavior: Feb and Mar were high (Feb: 18,150; Mar: 17,400); June also strong (17,650). The cumulative running total reaches 89k by June.

### Diagnostic — Why did it happen?

- High sales months are driven largely by Espresso Machine purchases (single high-ticket items create large month spikes — see region spikes like Butare in April).
- Kigali contributes the largest share — more customers and higher-ticket transactions (it has both many purchases of coffee beans and equipment).
- Customer revenue is skewed: a few customers (John Doe, Jane Smith) produce a significant share of revenue (top quartile).

### Prescriptive — What next / business actions?

- **Merchandising**: prioritize inventory of Espresso Machines and Coffee Beans; provide financing/installment offers for espresso machines (their purchases create large revenue bumps).
- **Marketing**: target top quartile customers (NTILE=4) with premium loyalty & bundle promotions to preserve high lifetime value. Use mid-quartile customers for upsell campaigns.
- **Operations**: adopt 3-month moving averages for purchasing/stock decisions to smooth volatility from one-off high-ticket sales.
- **Investigate spikes**: check if large machine purchases were one-off (e.g., corporate clients) vs. repeatable demand; if repeatable, plan stocking and promotions; if one-off, treat as anomaly.

---

## Proof of authenticity

### _See how this entire project was built from scratch in Vs Code_

1. Creating local git repository: see [screenshot](https://github.com/nshh123/plsql-window-functions-Sam-Musoni/blob/main/screenshots/15-Create%20local%20git%20repository%20before%20pushing.png)
2. Adding sql scripts, tracking and commiting changes: see [screenshot](screenshots/16-tracking%20changes%20and%20commits.png)
3. Adding screenshots, tracking and commiting changes: see [screenshot](screenshots/17-added%20screenshots%20to%20local%20repository.png)
4. Creating README.md: see [screenshot](screenshots/19-create%20README%20file.png)
5. Previewing README.md: see [screenshot](screenshots/20-previewing%20README%20in%20vscode.png)
6. Creating GitHub repository: see [screenshot](screenshots/21-create%20GitHub%20repository.png)
7. Pushing local git repository to GitHub: see [screenshot](screenshots/22-push%20git%20repository%20to%20GitHub.png)

---

## References

| Reference                                                                             | URL                                                                                                                      |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Oracle Analytic Functions — Oracle® Database SQL Language Reference                   | Click [here](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Analytic-Functions.html)                |
| Oracle Analytic Functions (older version)                                             | Click [here](https://docs.oracle.com/html/E26088_01/functions004.htm)                                                    |
| Oracle Base — Analytic Functions article                                              | Click [here](https://oracle-base.com/articles/misc/analytic-functions)                                                   |
| Simple Talk — Introduction to Analytic Functions (Part 2)                             | Click [here](https://www.red-gate.com/simple-talk/databases/oracle-databases/introduction-to-analytic-functions-part-2/) |
| Mode — Moving Averages in SQL (Mode Analytics)                                        | Click [here](https://mode.com/blog/moving-averages-in-sql/)                                                              |
| Peter Nicholson — How to Calculate a Moving Average in SQL                            | Click [here](https://petenicholson.co.uk/mastering-window-functions-how-to-calculate-a-moving-average-in-sql/)           |
| The Ultimate Guide to SQL Window Functions — StrataScratch                            | Click [here](https://www.stratascratch.com/blog/the-ultimate-guide-to-sql-window-functions/)                             |
| Analytical Functions in Oracle — LiveSQL Tutorial                                     | Click [here](https://livesql.oracle.com/apex/livesql/file/tutorial_GNRYA4548AQNXC0S04DXVEV08.html)                       |
| Academic: “Support Aggregate Analytic Window Function over Large Data by Spilling”    | Click [here](https://arxiv.org/abs/2007.10385)                                                                           |
| Academic: “Implementing Window Functions in a Column-Store with Late Materialization” | Click [here](https://arxiv.org/abs/2208.03586)                                                                           |
| Data modeling (ER-Diagram): dbdiagram.io                                              | Click [here](https://dbdiagram.io)                                                                                       |

> “All sources were properly cited. Implementations and analysis represent original work. No AI  
>  generated content was copied without attribution or adaptation.”
