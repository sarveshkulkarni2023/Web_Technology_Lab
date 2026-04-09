<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog · EBook Athenaeum</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600;700&family=Lora:wght@400;500;600&family=Manrope:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="library-topbar">
            <div class="library-brand"><span class="library-dot"></span>EBook Athenaeum</div>
            <div class="topbar-links">
                <a href="index.jsp" class="top-pill">Home</a>
                <a href="list" class="top-pill">Catalog</a>
                <a href="add" class="top-pill">Add Book</a>
            </div>
        </div>

        <!-- Dashboard Header -->
        <div class="card hero-card">
            <div class="header-actions">
                <div>
                    <div class="eyebrow">Library Dashboard</div>
                    <h2>Master Catalog</h2>
                    <p class="hero-subtext">View every record like a digital bookshelf with live stock and value snapshots.</p>
                </div>
                <a href="add" class="btn btn-accent">+ Add New Book</a>
            </div>

            <!-- Compute KPIs -->
            <c:set var="visibleBooks" value="${bookList.size()}" />
            <c:set var="totalStock" value="0" />
            <c:set var="lowStockCount" value="0" />
            <c:set var="outOfStockCount" value="0" />
            <c:set var="totalInventoryValue" value="0" />

            <c:forEach var="book" items="${bookList}">
                <c:set var="totalStock" value="${totalStock + book.quantity}" />
                <c:set var="totalInventoryValue" value="${totalInventoryValue + (book.price * book.quantity)}" />
                <c:if test="${book.quantity == 0}">
                    <c:set var="outOfStockCount" value="${outOfStockCount + 1}" />
                </c:if>
                <c:if test="${book.quantity > 0 && book.quantity <= 5}">
                    <c:set var="lowStockCount" value="${lowStockCount + 1}" />
                </c:if>
            </c:forEach>

            <!-- KPI Grid -->
            <div class="kpi-grid">
                <div class="kpi-card">
                    <span class="kpi-label">Total Volumes</span>
                    <span class="kpi-value">${totalRecords}</span>
                </div>
                <div class="kpi-card">
                    <span class="kpi-label">Visible Shelf</span>
                    <span class="kpi-value">${visibleBooks}</span>
                </div>
                <div class="kpi-card">
                    <span class="kpi-label">Units In View</span>
                    <span class="kpi-value">${totalStock}</span>
                </div>
                <div class="kpi-card">
                    <span class="kpi-label">Shelf Value</span>
                    <span class="kpi-value">
                        <fmt:formatNumber value="${totalInventoryValue}" type="currency" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2" />
                    </span>
                </div>
            </div>

            <div class="shelf-strip">
                <span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span>
                <span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span>
            </div>
        </div>

        <!-- Search Form -->
        <form action="list" method="get" class="search-bar">
            <input type="text" name="search" placeholder="Search by title or author..." value="${searchQuery}">
            <button type="submit" class="btn btn-primary">Search</button>
            <c:if test="${not empty searchQuery}">
                <a href="list" class="btn btn-soft">Clear</a>
            </c:if>
        </form>

        <!-- Table Card -->
        <div class="card table-card">
            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Unit Price</th>
                            <th>Stock</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${bookList}">
                            <tr>
                                <td>#${book.id}</td>
                                <td><strong>${book.title}</strong></td>
                                <td>${book.author}</td>
                                <td>
                                    <fmt:formatNumber value="${book.price}" type="currency" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2" />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${book.quantity == 0}">
                                            <span class="badge badge-stock-out">Unavailable</span>
                                        </c:when>
                                        <c:when test="${book.quantity <= 5}">
                                            <span class="badge badge-stock-low">Low: ${book.quantity}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-stock-ok">In Shelf: ${book.quantity}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><span class="badge badge-category">${book.category}</span></td>
                                <td class="actions">
                                    <a href="edit?id=${book.id}" class="btn btn-sm btn-primary">Edit</a>
                                    <a href="delete?id=${book.id}" class="btn btn-sm btn-danger" onclick="return confirm('Remove this volume from the Athenaeum?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty bookList}">
                            <tr>
                                <td colspan="7">
                                    <div class="empty-state">
                                        <h3>📭 No titles on this shelf</h3>
                                        <p>Try a new search phrase or add a fresh book record.</p>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <c:if test="${not empty bookList}">
                <div class="page-meta">
                    ⚡ Low stock in view: <strong>${lowStockCount}</strong> &nbsp;|&nbsp; ❌ Unavailable: <strong>${outOfStockCount}</strong>
                </div>
            </c:if>
        </div>

        <!-- Pagination -->
        <c:if test="${noOfPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage != 1}">
                    <a href="list?page=${currentPage - 1}&search=${searchQuery}">&laquo; Previous</a>
                </c:if>

                <c:forEach begin="1" end="${noOfPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage eq i}">
                            <a href="#" class="active">${i}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="list?page=${i}&search=${searchQuery}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage != noOfPages}">
                    <a href="list?page=${currentPage + 1}&search=${searchQuery}">Next &raquo;</a>
                </c:if>
            </div>
        </c:if>

        <div class="back-link-wrap">
            <a href="index.jsp" class="back-link">&larr; Return to Home</a>
        </div>
    </div>
</body>
</html>