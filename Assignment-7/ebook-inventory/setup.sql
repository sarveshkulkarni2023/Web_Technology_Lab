CREATE DATABASE IF NOT EXISTS ebook_db;
USE ebook_db;

CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data
INSERT INTO books (title, author, price, quantity, category) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 15.99, 10, 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 12.50, 5, 'Fiction'),
('1984', 'George Orwell', 10.99, 20, 'Dystopian'),
('The Hobbit', 'J.R.R. Tolkien', 18.75, 8, 'Fantasy'),
('Clean Code', 'Robert C. Martin', 45.00, 15, 'Technology'),
('Effective Java', 'Joshua Bloch', 50.00, 12, 'Technology'),
('Design Patterns', 'Gang of Four', 55.00, 7, 'Technology'),
('The Alchemist', 'Paulo Coelho', 14.00, 25, 'Adventure'),
('Sapiens', 'Yuval Noah Harari', 22.99, 30, 'History'),
('Deep Work', 'Cal Newport', 19.50, 18, 'Self-Help'),
('Atomic Habits', 'James Clear', 16.99, 40, 'Self-Help'),
('The Pragmatic Programmer', 'Andrew Hunt', 48.00, 10, 'Technology');
