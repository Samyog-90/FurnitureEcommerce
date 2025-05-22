<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
        <nav class="navbar">
            <a href="#" class="nav-logo">
                <h1 class="logo-text">VINTIQUE</h1>
            </a>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/" class="nav-link home-link">HOME</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Product.jsp" class="nav-link">PRODUCT</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Blog.jsp" class="nav-link">BLOG</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Contact.jsp" class="nav-link">CONTACTS</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/AboutUs.jsp" class="nav-link">ABOUT US</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Login.jsp" class="nav-link">LOGIN</a>
                </li>
                 <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/Registration.jsp" class="nav-link">REGISTER</a>
                </li>
                </li>
                 <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/userprofile" class="nav-link">PROFILE</a>
                </li>
            </ul>
        </nav>
    </header>
</body>
</html>