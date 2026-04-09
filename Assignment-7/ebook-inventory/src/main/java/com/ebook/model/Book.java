package com.ebook.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Book implements Serializable {
    private int id;
    private String title;
    private String author;
    private BigDecimal price;
    private int quantity;
    private String category;

    public Book() {}

    public Book(int id, String title, String author, BigDecimal price, int quantity, String category) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
    }

    public Book(String title, String author, BigDecimal price, int quantity, String category) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}
