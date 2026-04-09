<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${action eq 'edit' ? 'Edit Volume' : 'Add New Volume'} · Athenaeum</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600;700&family=Lora:wght@400;500;600&family=Manrope:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container form-shell">
        <div class="library-topbar">
            <div class="library-brand"><span class="library-dot"></span>EBook Athenaeum</div>
            <div class="topbar-links">
                <a href="index.jsp" class="top-pill">Home</a>
                <a href="list" class="top-pill">Catalog</a>
                <a href="add" class="top-pill">Add Book</a>
            </div>
        </div>

        <div class="card hero-card">
            <div class="form-heading">
                <div class="eyebrow">📋 Catalog Entry</div>
                <h2>${action eq 'edit' ? 'Edit Library Volume' : 'Add A New Volume'}</h2>
                <p>Capture complete metadata so your digital shelves stay beautifully organized and searchable.</p>
            </div>

            <form action="${action eq 'edit' ? 'edit' : 'add'}" method="post">
                <c:if test="${action eq 'edit'}">
                    <input type="hidden" name="id" value="${book.id}" />
                </c:if>

                <div class="form-group">
                    <label for="title">📚 Book Title</label>
                    <input type="text" id="title" name="title" value="${book.title}" required 
                           placeholder="e.g. The Alchemist">
                    <div class="form-helper">Use the official title to improve discovery.</div>
                </div>

                <div class="form-group">
                    <label for="author">✍️ Author</label>
                    <input type="text" id="author" name="author" value="${book.author}" required 
                           placeholder="e.g. Paulo Coelho">
                </div>

                <div class="form-group">
                    <label for="price">💰 Price ($)</label>
                    <input type="number" step="0.01" min="0" id="price" name="price" 
                           value="${book.price}" required placeholder="0.00">
                </div>

                <div class="form-group">
                    <label for="quantity">📦 Quantity</label>
                    <input type="number" id="quantity" name="quantity" min="0" 
                           value="${book.quantity}" required placeholder="0">
                </div>

                <div class="form-group">
                    <label for="category">🏷️ Category</label>
                    <select id="category" name="category">
                        <option value="Fiction" ${book.category eq 'Fiction' ? 'selected' : ''}>Fiction</option>
                        <option value="Technology" ${book.category eq 'Technology' ? 'selected' : ''}>Technology</option>
                        <option value="Fantasy" ${book.category eq 'Fantasy' ? 'selected' : ''}>Fantasy</option>
                        <option value="History" ${book.category eq 'History' ? 'selected' : ''}>History</option>
                        <option value="Self-Help" ${book.category eq 'Self-Help' ? 'selected' : ''}>Self-Help</option>
                        <option value="Other" ${book.category eq 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        ${action eq 'edit' ? '💾 Save Changes' : '✨ Add To Catalog'}
                    </button>
                    <a href="list" class="btn btn-soft">Cancel</a>
                </div>
            </form>
        </div>

        <div class="back-link-wrap">
            <a href="list" class="back-link">&larr; Back to Catalog</a>
        </div>
    </div>
</body>
</html>