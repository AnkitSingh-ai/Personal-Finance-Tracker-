-- 1️⃣ View all transactions
SELECT * FROM Transactions;

-- 2️⃣ Total Income, Expense, and Balance
SELECT 
    SUM(CASE WHEN C.type='Income' THEN T.amount ELSE 0 END) AS Total_Income,
    SUM(CASE WHEN C.type='Expense' THEN T.amount ELSE 0 END) AS Total_Expense,
    SUM(CASE WHEN C.type='Income' THEN T.amount ELSE 0 END) -
    SUM(CASE WHEN C.type='Expense' THEN T.amount ELSE 0 END) AS Balance
FROM Transactions T
JOIN Categories C ON T.category_id = C.category_id;

-- 3️⃣ Monthly Summary
SELECT 
    strftime('%Y-%m', txn_date) AS Month,
    SUM(CASE WHEN C.type='Income' THEN amount ELSE 0 END) AS Income,
    SUM(CASE WHEN C.type='Expense' THEN amount ELSE 0 END) AS Expense
FROM Transactions T
JOIN Categories C ON T.category_id = C.category_id
GROUP BY Month
ORDER BY Month;

-- 4️⃣ Category-wise Expense Summary
SELECT 
    category_name,
    SUM(amount) AS Total_Spent
FROM Transactions T
JOIN Categories C ON T.category_id = C.category_id
WHERE C.type='Expense'
GROUP BY category_name
ORDER BY Total_Spent DESC;

-- 5️⃣ View Current Balance
SELECT * FROM BalanceView;
