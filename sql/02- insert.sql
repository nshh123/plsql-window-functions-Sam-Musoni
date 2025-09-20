-- Customers
INSERT INTO customers (customer_id, name, region) VALUES (1,'John Doe','Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (2,'Jane Smith','Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (3,'Alice Brown','Butare');
INSERT INTO customers (customer_id, name, region) VALUES (4,'Bob Martin','Gisenyi');
INSERT INTO customers (customer_id, name, region) VALUES (5,'Carol Lee','Kigali');
INSERT INTO customers (customer_id, name, region) VALUES (6,'David Kim','Butare');

-- Products
INSERT INTO products (product_id, name, category) VALUES (101,'Coffee Beans','Beverages');
INSERT INTO products (product_id, name, category) VALUES (102,'Tea Leaves','Beverages');
INSERT INTO products (product_id, name, category) VALUES (103,'Chocolate','Snacks');
INSERT INTO products (product_id, name, category) VALUES (104,'Cookies','Snacks');
INSERT INTO products (product_id, name, category) VALUES (105,'Espresso Machine','Equipment');
INSERT INTO products (product_id, name, category) VALUES (106,'Muffins','Bakery');

-- Transactions (transaction_id, customer_id, product_id, sale_date, amount)
INSERT INTO transactions VALUES (1,1,101,TO_DATE('2024-01-05','YYYY-MM-DD'),2500);
INSERT INTO transactions VALUES (2,2,101,TO_DATE('2024-01-12','YYYY-MM-DD'),1800);
INSERT INTO transactions VALUES (3,3,102,TO_DATE('2024-01-20','YYYY-MM-DD'),1200);
INSERT INTO transactions VALUES (4,4,103,TO_DATE('2024-01-25','YYYY-MM-DD'),900);
INSERT INTO transactions VALUES (5,5,104,TO_DATE('2024-02-02','YYYY-MM-DD'),700);
INSERT INTO transactions VALUES (6,1,103,TO_DATE('2024-02-14','YYYY-MM-DD'),1500);
INSERT INTO transactions VALUES (7,2,105,TO_DATE('2024-02-18','YYYY-MM-DD'),8000);
INSERT INTO transactions VALUES (8,3,101,TO_DATE('2024-02-23','YYYY-MM-DD'),2600);
INSERT INTO transactions VALUES (9,6,106,TO_DATE('2024-02-28','YYYY-MM-DD'),450);
INSERT INTO transactions VALUES (10,1,101,TO_DATE('2024-03-03','YYYY-MM-DD'),2700);
INSERT INTO transactions VALUES (11,2,104,TO_DATE('2024-03-16','YYYY-MM-DD'),1100);
INSERT INTO transactions VALUES (12,4,105,TO_DATE('2024-03-20','YYYY-MM-DD'),8200);
INSERT INTO transactions VALUES (13,5,103,TO_DATE('2024-03-22','YYYY-MM-DD'),1300);
INSERT INTO transactions VALUES (14,6,102,TO_DATE('2024-03-25','YYYY-MM-DD'),1400);
INSERT INTO transactions VALUES (15,1,106,TO_DATE('2024-04-02','YYYY-MM-DD'),600);
INSERT INTO transactions VALUES (16,2,101,TO_DATE('2024-04-10','YYYY-MM-DD'),2000);
INSERT INTO transactions VALUES (17,3,104,TO_DATE('2024-04-12','YYYY-MM-DD'),750);
INSERT INTO transactions VALUES (18,4,103,TO_DATE('2024-04-15','YYYY-MM-DD'),950);
INSERT INTO transactions VALUES (19,5,101,TO_DATE('2024-04-20','YYYY-MM-DD'),2400);
INSERT INTO transactions VALUES (20,6,105,TO_DATE('2024-04-28','YYYY-MM-DD'),8300);
INSERT INTO transactions VALUES (21,1,102,TO_DATE('2024-05-03','YYYY-MM-DD'),1300);
INSERT INTO transactions VALUES (22,2,103,TO_DATE('2024-05-09','YYYY-MM-DD'),1000);
INSERT INTO transactions VALUES (23,3,101,TO_DATE('2024-05-11','YYYY-MM-DD'),2550);
INSERT INTO transactions VALUES (24,4,104,TO_DATE('2024-05-18','YYYY-MM-DD'),900);
INSERT INTO transactions VALUES (25,5,106,TO_DATE('2024-05-25','YYYY-MM-DD'),550);
INSERT INTO transactions VALUES (26,6,101,TO_DATE('2024-06-01','YYYY-MM-DD'),2650);
INSERT INTO transactions VALUES (27,1,105,TO_DATE('2024-06-07','YYYY-MM-DD'),8400);
INSERT INTO transactions VALUES (28,2,102,TO_DATE('2024-06-14','YYYY-MM-DD'),1500);
INSERT INTO transactions VALUES (29,3,103,TO_DATE('2024-06-18','YYYY-MM-DD'),1100);
INSERT INTO transactions VALUES (30,4,101,TO_DATE('2024-06-22','YYYY-MM-DD'),2300);
INSERT INTO transactions VALUES (31,5,104,TO_DATE('2024-06-25','YYYY-MM-DD'),1200);
INSERT INTO transactions VALUES (32,6,106,TO_DATE('2024-06-28','YYYY-MM-DD'),500);
-- extras to create ties & realistic distribution
INSERT INTO transactions VALUES (33,2,101,TO_DATE('2024-03-05','YYYY-MM-DD'),2700);
INSERT INTO transactions VALUES (34,5,101,TO_DATE('2024-02-05','YYYY-MM-DD'),2400);
INSERT INTO transactions VALUES (35,1,101,TO_DATE('2024-02-08','YYYY-MM-DD'),2500);
INSERT INTO transactions VALUES (36,3,105,TO_DATE('2024-05-20','YYYY-MM-DD'),8100);
