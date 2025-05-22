<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VINTIQUE </title>
    <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/Home.css"/>
</head>
<body>
    <header>
        <nav class="navbar">
            <a href="#" class="nav-logo">
                <h1 class="logo-text">VINTIQUE</h1>
            </a>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Home" class="nav-link home-link">HOME</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Product" class="nav-link">PRODUCT</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Blog" class="nav-link">BLOG</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/contactus" class="nav-link">CONTACTS</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Aboutus" class="nav-link">ABOUT US</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Login" class="nav-link">LOGIN</a>
                    
                  <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Registration" class="nav-link">REGISTER</a>
                </li>
                
                    <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/userprofile" class="nav-link">PROFILE</a>
                </li>
            
            </ul>
        </nav>
    </header>
    <main>
        <section class="hero-section">
            <div class="furniture-display">
                <!-- The background image will show the chairs and table -->
            </div>
            <div class="content-wrapper">
                <div class="hero-details">
                    <h2 class="title">Elegant & Classy</h2>
                    <p class="subtitle">"Where timeless design meets everyday comfort."</p>
                </div>
                <div class="buttons">
                    <a href="#" class="shop-now-btn">SHOP NOW</a>
                </div>
            </div>
        </section>
    </main>
</body>
</html>