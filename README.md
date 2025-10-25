# 💰 Personal Finance Tracker (SQL Project)

### 🧩 Overview
The **Personal Finance Tracker** is a SQL-based database project that helps users track income, expenses, and balance over time.  
It uses SQL queries to generate insights such as monthly summaries, category-wise expenses, and total balance reports.

This project was developed as part of an internship to demonstrate practical SQL skills — including schema design, data insertion, aggregation, and query optimization.

---

### 🧱 Database Design

**Tables:**
1. `Users` — Stores user information  
2. `Categories` — Stores income/expense categories  
3. `Transactions` — Stores all financial transactions  
4. `BalanceView` — A SQL view for quick balance summary  

---

### 🧰 Tools Used
- **Database:** SQLite  
- **Interface:** DB Browser for SQLite  
- **Language:** SQL  
- **Exports:** CSV Reports  

---

### 🧾 Schema (DDL)
```sql
CREATE TABLE Users (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL
);

CREATE TABLE Categories (
  category_id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_name TEXT NOT NULL,
  type TEXT CHECK(type IN ('Income','Expense')) NOT NULL
);

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
