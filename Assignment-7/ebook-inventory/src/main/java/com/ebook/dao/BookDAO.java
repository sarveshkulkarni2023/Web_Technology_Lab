package com.ebook.dao;

import com.ebook.model.Book;
import com.ebook.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private static final String INSERT_BOOK_SQL = "INSERT INTO books (title, author, price, quantity, category) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_BOOK_BY_ID = "SELECT id, title, author, price, quantity, category FROM books WHERE id = ?";
    private static final String SELECT_ALL_BOOKS = "SELECT * FROM books LIMIT ? OFFSET ?";
    private static final String DELETE_BOOK_SQL = "DELETE FROM books WHERE id = ?";
    private static final String UPDATE_BOOK_SQL = "UPDATE books SET title = ?, author = ?, price = ?, quantity = ?, category = ? WHERE id = ?";
    private static final String SEARCH_BOOKS_SQL = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ? LIMIT ? OFFSET ?";
    private static final String COUNT_BOOKS_SQL = "SELECT COUNT(*) FROM books";
    private static final String COUNT_SEARCH_BOOKS_SQL = "SELECT COUNT(*) FROM books WHERE title LIKE ? OR author LIKE ?";

    public void insertBook(Book book) throws SQLException {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL)) {
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setBigDecimal(3, book.getPrice());
            preparedStatement.setInt(4, book.getQuantity());
            preparedStatement.setString(5, book.getCategory());
            preparedStatement.executeUpdate();
        }
    }

    public Book getBook(int id) {
        Book book = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String author = rs.getString("author");
                java.math.BigDecimal price = rs.getBigDecimal("price");
                int quantity = rs.getInt("quantity");
                String category = rs.getString("category");
                book = new Book(id, title, author, price, quantity, category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    public List<Book> selectAllBooks(int limit, int offset) {
        List<Book> books = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS)) {
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, offset);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                java.math.BigDecimal price = rs.getBigDecimal("price");
                int quantity = rs.getInt("quantity");
                String category = rs.getString("category");
                books.add(new Book(id, title, author, price, quantity, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public List<Book> searchBooks(String query, int limit, int offset) {
        List<Book> books = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BOOKS_SQL)) {
            String searchQuery = "%" + query + "%";
            preparedStatement.setString(1, searchQuery);
            preparedStatement.setString(2, searchQuery);
            preparedStatement.setInt(3, limit);
            preparedStatement.setInt(4, offset);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                java.math.BigDecimal price = rs.getBigDecimal("price");
                int quantity = rs.getInt("quantity");
                String category = rs.getString("category");
                books.add(new Book(id, title, author, price, quantity, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public boolean deleteBook(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BOOK_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateBook(Book book) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_BOOK_SQL)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setBigDecimal(3, book.getPrice());
            statement.setInt(4, book.getQuantity());
            statement.setString(5, book.getCategory());
            statement.setInt(6, book.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public int getTotalRecords() {
        int total = 0;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_BOOKS_SQL)) {
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public int getTotalSearchRecords(String query) {
        int total = 0;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_SEARCH_BOOKS_SQL)) {
            String searchQuery = "%" + query + "%";
            preparedStatement.setString(1, searchQuery);
            preparedStatement.setString(2, searchQuery);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
}
