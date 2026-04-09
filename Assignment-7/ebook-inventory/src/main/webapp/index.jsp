<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EBook Athenaeum · Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600;700&family=Lora:wght@400;500;600&family=Manrope:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <!-- Top Bar -->
        <div class="library-topbar">
            <div class="library-brand">
                <span class="library-dot"></span>EBook Athenaeum
            </div>
            <div class="topbar-links">
                <a href="index.jsp" class="top-pill">Home</a>
                <a href="list" class="top-pill">Catalog</a>
                <a href="add" class="top-pill">Add Book</a>
            </div>
        </div>

        <!-- Hero Section -->
        <div class="card hero-card">
            <div class="eyebrow">✦ Curated Reading Room ✦</div>
            <h1>Digital Library<br>Inventory</h1>
            <p class="hero-subtext">
                Build a premium catalog experience for your ebook collection. Track stock, discover low‑availability titles,
                and maintain your shelf like a modern librarian.
            </p>

            <div class="hero-actions">
                <a href="list" class="btn btn-primary">Explore Catalog</a>
                <a href="add" class="btn btn-accent">Add New Volume</a>
                <a href="list?search=" class="btn btn-soft">Quick Browse</a>
            </div>

            <!-- Animated Shelf Strip -->
            <div class="shelf-strip">
                <span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span>
                <span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span><span class="shelf-book"></span>
            </div>

            <!-- Feature Cards -->
            <div class="feature-grid">
                <div class="feature-card">
                    <h3>📖 Curated Discovery</h3>
                    <p>Instantly locate books by title or author from one elegant command bar.</p>
                </div>
                <div class="feature-card">
                    <h3>📊 Smart Shelf Signals</h3>
                    <p>See in‑stock, low‑stock, and unavailable titles with clear visual indicators.</p>
                </div>
                <div class="feature-card">
                    <h3>⚡ Archivist Workflow</h3>
                    <p>Edit, update, and maintain records in a fast and distraction‑free interface.</p>
                </div>
            </div>
        </div>

        <!-- Subtle footer note -->
        <div class="page-meta">
            ✦ The Athenaeum · Where every book has its place ✦
        </div>
    </div>
</body>
</html>