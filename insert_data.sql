-- Insert Sample User
INSERT INTO Users (name, email) VALUES 
('Ankit Singh', 'ankit@example.com');

-- Insert Income & Expense Categories
INSERT INTO Categories (category_name, type) VALUES
('Salary', 'Income'),
('Freelance', 'Income'),
('Groceries', 'Expense'),
('Rent', 'Expense'),
('Entertainment', 'Expense');

-- Insert Transactions
INSERT INTO Transactions (user_id, category_id, amount, txn_date, description) VALUES
(1, 1, 50000, '2025-10-01', 'Monthly salary'),
(1, 3, 5000, '2025-10-03', 'Supermarket groceries'),
(1, 4, 12000, '2025-10-05', 'Apartment rent'),
(1, 2, 8000, '2025-10-10', 'Freelance project'),
(1, 5, 2000, '2025-10-15', 'Movies and dining');
