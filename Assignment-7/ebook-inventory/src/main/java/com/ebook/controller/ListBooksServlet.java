package com.ebook.controller;

import com.ebook.dao.BookDAO;
import com.ebook.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class ListBooksServlet extends HttpServlet {
    private BookDAO bookDAO;

    @Override
    public void init() {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String searchQuery = request.getParameter("search");
        List<Book> listBook;
        int totalRecords;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            listBook = bookDAO.searchBooks(searchQuery, recordsPerPage, (page - 1) * recordsPerPage);
            totalRecords = bookDAO.getTotalSearchRecords(searchQuery);
        } else {
            listBook = bookDAO.selectAllBooks(recordsPerPage, (page - 1) * recordsPerPage);
            totalRecords = bookDAO.getTotalRecords();
        }

        int noOfPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

        request.setAttribute("bookList", listBook);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("searchQuery", searchQuery);

        request.getRequestDispatcher("views/list-books.jsp").forward(request, response);
    }
}
