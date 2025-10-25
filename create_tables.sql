-- Create Users Table
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- Create Categories Table
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL,
    type TEXT CHECK(type IN ('Income','Expense')) NOT NULL
);

-- Create Transactions Table
CREATE TABLE Transactions (
    txn_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    category_id INTEGER,
    amount REAL NOT NULL,
    txn_date DATE NOT NULL,
    description TEXT,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(category_id) REFERENCES Categories(category_id)
);

-- Create a Balance View
CREATE VIEW BalanceView AS
SELECT 
    U.name,
    SUM(CASE WHEN C.type = 'Income' THEN T.amount ELSE 0 END) -
    SUM(CASE WHEN C.type = 'Expense' THEN T.amount ELSE 0 END) AS Current_Balance
FROM Users U
JOIN Transactions T ON U.user_id = T.user_id
JOIN Categories C ON T.category_id = C.category_id
GROUP BY U.user_id;
